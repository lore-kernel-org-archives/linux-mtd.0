Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USvuY-00081f-C2
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2013 20:58:32 +0000
Received: by mail-we0-f179.google.com with SMTP id p43so2795869wea.24
 for <linux-mtd@lists.infradead.org>; Thu, 18 Apr 2013 13:58:26 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304181630.58886.vapier@gentoo.org>
Date: Thu, 18 Apr 2013 22:58:22 +0200
In-Reply-To: <201304181630.58886.vapier@gentoo.org> (Mike Frysinger's message
 of "Thu, 18 Apr 2013 16:30:55 -0400")
Message-ID: <8761zjimj5.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel@free-electrons.com>, linux-mtd@lists.infradead.org,
 Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 Mike> i wonder if the write support should be put behind a CONFIG
 Mike> option.  personally, the write support is kind of neat and
 Mike> semi-useful for development, but i don't plan on shipping
 Mike> anything on that :).  i just want read-only support to load an
 Mike> ext2 fs on top of UBI.

Agreed, I think most people would just use ubifs if they want a
read/write fs on ubi, and ubiblk for ro ext/squashfs/..

-- 
Bye, Peter Korsgaard
