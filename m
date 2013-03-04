Received: from mail-we0-f169.google.com ([74.125.82.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCQ88-0004jA-M9
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 07:48:17 +0000
Received: by mail-we0-f169.google.com with SMTP id t11so4463079wey.28
 for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2013 23:47:50 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH v2] mtd: devices: elm: check for device's presence before
 configuration
References: <1362355040-27344-1-git-send-email-zonque@gmail.com>
Date: Mon, 04 Mar 2013 08:47:47 +0100
In-Reply-To: <1362355040-27344-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Mon, 4 Mar 2013 00:57:20 +0100")
Message-ID: <87r4jvehcs.fsf@dell.be.48ers.dk>
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
 Daniel> during boot.

 Daniel> Make elm_config() return an error in such cases to propagate the error
 Daniel> up to the user, so it can fall back to software mode.

 Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
 Daniel> Cc: Philip Avinash <avinashphilip@ti.com>
 Daniel> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
 Daniel> Cc: Peter Korsgaard <jacmet@sunsite.dk>

Acked-by: Peter Korsgaard <jacmet@sunsite.dk>

-- 
Bye, Peter Korsgaard
