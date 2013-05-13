Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubn8n-0006EM-2k
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:25:49 +0000
Message-ID: <1368430080.5360.11.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 13 May 2013 10:28:00 +0300
In-Reply-To: <201304181630.58886.vapier@gentoo.org>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304181630.58886.vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel@free-electrons.com>, linux-mtd@lists.infradead.org,
 Tim Bird <tim.bird@am.sony.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-04-18 at 16:30 -0400, Mike Frysinger wrote:
> 
> imo, that support needs to be re-added.  it'd be great if we could do
> it via 
> the existing /dev/ubi_ctrl knob, but maybe that'll only work if ubi
> +ubiblock 
> are built into the kernel, or if ubiblock is merged with ubi ?

Yeah, re-using the ubi_ctl device makes sense. And UBI can probably
invoke 'request_module()' if needed, so that we avoid any of "work only
if both built-in" conditions.

-- 
Best Regards,
Artem Bityutskiy
