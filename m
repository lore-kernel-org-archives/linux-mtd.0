Received: from femail31.sdc1.sfba.home.com ([24.254.60.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Ut5G-0002Zf-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2001 17:54:58 +0100
Received: from gizmo.bdkw.yi.org ([24.114.137.50])
          by femail31.sdc1.sfba.home.com
          (InterMail vM.4.01.03.20 201-229-121-120-20010223) with SMTP
          id <20010809170042.CHVE27087.femail31.sdc1.sfba.home.com@gizmo.bdkw.yi.org>
          for <linux-mtd@lists.infradead.org>;
          Thu, 9 Aug 2001 10:00:42 -0700
Date: Thu, 9 Aug 2001 13:00:41 -0400 (EDT)
From: "A. Craig West" <acwest-jffs@mail.bdkw.yi.org>
To: Vipin Malik <vipin.malik@daniel.com>
cc: David Woodhouse <dwmw2@infradead.org>, jffs-dev <jffs-dev@axis.com>,
    MTD for Linux <linux-mtd@lists.infradead.org>,
    elw_dev_list@embeddedlinuxworks.com
Subject: Re: JFFS2 is broken
In-Reply-To: <3B3BC857.7FB81774@daniel.com>
Message-ID: <Pine.LNX.4.10.10108091255370.12113-100000@gizmo.bdkw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Is there any more word on this problem? I'm planning on porting jffs2 to the
Agenda VR3, but have been holding off for a resolution of this issue...
By the way, has anybody else noticed that there has been no traffic on this list
in at least a week?

On Thu, 28 Jun 2001, Vipin Malik wrote:

> For all practical purposes, JFFS2, in its present form, IMHO,  is
> broken.
> 
> I've been doing a lot of "jitter" or "blocking" time testing for various
> tasks running on a system where there is JFFS2 activity going on (info
> for those that have not been following my posts).
-Snipped, but boils down to kernel blocks for up to 30 seconds-

-- 
Craig West         Ph: (416) 213-0300	|  It's not a bug,
acwest-sig@mail.bdkw.yi.org          	|  It's a feature...
