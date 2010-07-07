Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWZG5-0006o2-M1
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2010 18:22:10 +0000
Message-ID: <4C34C5C6.7010008@broadcom.com>
Date: Wed, 7 Jul 2010 11:21:58 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd-utils: formatting of odd-sized OOB in nanddump
References: <1276706527-4563-1-git-send-email-norris@broadcom.com>
	<1278511674.12733.18.camel@localhost>
In-Reply-To: <1278511674.12733.18.camel@localhost>
Content-Type: text/plain;
 charset=utf-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Why 10 bytes, why not 12 or 14?

As of now, the only OOB-size that's not a multiple of 16 supported in 
the other bits of ugly code is 218-bytes.

218 % 16 = 10

What's the point of checking for a "supported" page-size/OOB-size 
earlier if we're not gonna use that info? :)

> I think it is better to just copy-paste-modify the kernel
> print_hex_dump() and utilize it, instead of this ugly crocodile code ...

I'm looking at that, since it seems a better solution. Does anyone 
oppose including ASCII output in the "pretty" option? It's built in to 
the print_hex_dump() already, so it shouldn't be too difficult to adapt. 
Anyway, it seems that someone intended to print ASCII at some point 
(nanddump.c, line 77):

static bool             pretty_print = false;   // print nice in ascii
