Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCGjV-0002Sg-My
 for linux-mtd@lists.infradead.org; Sun, 03 Mar 2013 21:46:14 +0000
Received: by mail-ee0-f49.google.com with SMTP id d41so3417071eek.8
 for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2013 13:44:08 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH] mtd: devices: elm: check for device's presence before
 configuration
References: <1362345178-12536-1-git-send-email-zonque@gmail.com>
Date: Sun, 03 Mar 2013 22:44:05 +0100
In-Reply-To: <1362345178-12536-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Sun, 3 Mar 2013 22:12:58 +0100")
Message-ID: <87k3pow44a.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> In case the driver is not probed - due to config mismatches or errors
 Daniel> in the DTS files - dev_get_drvdata() returns NULL, leading to an Ooops
 Daniel> during boot. Better bail out with a warning in such cases.

 Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
 Daniel> Cc: Philip Avinash <avinashphilip@ti.com>
 Daniel> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
 Daniel> ---
 Daniel>  drivers/mtd/devices/elm.c | 5 +++++
 Daniel>  1 file changed, 5 insertions(+)

 Daniel> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
 Daniel> index 2ec5da9..a9b6d04 100644
 Daniel> --- a/drivers/mtd/devices/elm.c
 Daniel> +++ b/drivers/mtd/devices/elm.c
 Daniel> @@ -86,6 +86,11 @@ void elm_config(struct device *dev, enum bch_ecc bch_type)
 Daniel>  	u32 reg_val;
 Daniel>  	struct elm_info *info = dev_get_drvdata(dev);
 
 Daniel> +	if (!info) {
 Daniel> +		dev_err(dev, "Unable to configure elm - device not probed?\n");
 Daniel> +		return;
 Daniel> +	}
 Daniel> +

Even better would be to propagate the error message (E.G. return
-ENODEV) and let omap2.c deal with it (fall back to sw).

-- 
Bye, Peter Korsgaard
