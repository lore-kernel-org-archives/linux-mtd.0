Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15h8QN-0000SB-00
	for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2001 12:43:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <009801c13b7f$e7756380$110aa8c0@vistatopology.com> 
References: <009801c13b7f$e7756380$110aa8c0@vistatopology.com>  <Pine.LNX.4.33.0109102046090.30849-100000@imladris.demon.co.uk> 
To: "Alex Liao" <alex@vistatopology.com>
Cc: "Chris Lesiak" <clesiak@licor.com>, linux-mtd@lists.infradead.org,
    "Siders, Keith" <keith_siders@toshibatv.com>
Subject: Re: Partition question... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 Sep 2001 12:49:09 +0100
Message-ID: <19570.1000295349@redhat.com>
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

alex@vistatopology.com said:
>    I want to partition my MTD devices , it physical address :
>     CS0: 0x00000000 - 0x00800000
>     CS1: 0x10000000 - 0x10800000
>     How should I to haldle it ? 

What's at 0x800000-0xffffff? A second image of CS0? If so, just copy one of 
the existing map drivers and make it length 0x10800000. Then after calling 
the chip probe routines you set up your array of struct mtd_partitions and 
call add_mtd_partitions. There are plenty of examples to crib from.

--
dwmw2
