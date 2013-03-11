Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEysY-0004bm-3I
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2013 09:18:48 +0000
Message-ID: <1362993580.5101.63.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: devices: elm: check for device's presence
 before configuration
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Daniel Mack <zonque@gmail.com>
Date: Mon, 11 Mar 2013 11:19:40 +0200
In-Reply-To: <1362355040-27344-1-git-send-email-zonque@gmail.com>
References: <1362355040-27344-1-git-send-email-zonque@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 00:57 +0100, Daniel Mack wrote:
> In case the driver is not probed - due to config mismatches or errors
> in the DTS files - dev_get_drvdata() returns NULL, leading to an Ooops
> during boot.
> 
> Make elm_config() return an error in such cases to propagate the error
> up to the user, so it can fall back to software mode.
> 
> Signed-off-by: Daniel Mack <zonque@gmail.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
