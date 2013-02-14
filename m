Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5tFh-0002GV-SE
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2013 07:29:06 +0000
Message-ID: <1360826960.12703.159.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC 5/5] UBIFS: add ubifs_err() to print error reason
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 14 Feb 2013 09:29:20 +0200
In-Reply-To: <1360750998-15191-6-git-send-email-mkl@pengutronix.de>
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
 <1360750998-15191-6-git-send-email-mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Subodh Nijsure <snijsure@grid-net.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-02-13 at 11:23 +0100, Marc Kleine-Budde wrote:
>         err = ubifs_init_security(dir, inode, &dentry->d_name);
> -       if (err)
> +       if (err) {
> +               ubifs_err("cannot initialize extended attribute, error %d",
> +                         err);
>                 goto out_cancel;
> +       }

Would you please instead make 'ubifs_init_security()' print the error
message.

-- 
Best Regards,
Artem Bityutskiy
