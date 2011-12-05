Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXSOX-0001CT-HV
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 06:51:21 +0000
Received: by laai10 with SMTP id i10so1302266laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 22:51:20 -0800 (PST)
Subject: RE: [PATCH] [MTD:UBI] Missing scrub when there is a bit-flip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bhavesh Parekh <bparekh@nvidia.com>
Date: Mon, 05 Dec 2011 08:51:17 +0200
In-Reply-To: <6F5E0EB93579CE4A99BFB2D6A9D015057D9CA89A59@BGMAIL01.nvidia.com>
References: <1322655222-28348-1-git-send-email-bparekh@nvidia.com>
 <1322655222-28348-2-git-send-email-bparekh@nvidia.com>
 <1323007803.9400.56.camel@sauron.fi.intel.com>
 <6F5E0EB93579CE4A99BFB2D6A9D015057D9CA89A59@BGMAIL01.nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323067879.2316.32.camel@koala>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-12-05 at 11:29 +0530, Bhavesh Parekh wrote:
> Artem,
> 
> Currently we have K36 setup with most of the critical ubi fixes in it. Verified that this patch fixes the mentioned issue.
> Also we have K39 tree and I am planning to verify the this issue in that tree as well after porting the change and fixes from the ubi tree.

Thanks. I've added CC to stable in the commit message.

Artem.
