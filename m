Received: from yergi.telenet-ops.be ([195.130.132.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NE0qu-0003vl-Cp
	for linux-mtd@lists.infradead.org; Fri, 27 Nov 2009 13:27:16 +0000
Received: from gerard.telenet-ops.be (unknown [195.130.132.48])
	by yergi.telenet-ops.be (Postfix) with ESMTP id 08CCD5C8903
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Nov 2009 14:27:11 +0100 (CET)
From: "Ronny Dierckx" <ronny.dierckx@telenet.be>
To: "'Adrian Hunter'" <adrian.hunter@nokia.com>
References: <001301ca6edc$5fc49660$1f4dc320$@dierckx@telenet.be>
	<4B0F8B78.5080405@nokia.com>
In-Reply-To: <4B0F8B78.5080405@nokia.com>
Subject: RE: UBIFS synchronisation questions about file create/delete
Date: Fri, 27 Nov 2009 14:26:51 +0100
Message-ID: <000001ca6f65$4752a8e0$d5f7faa0$@dierckx@telenet.be>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: nl-be
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>No it is not normal behaviour.
>
>10 minutes is long enough for everything to be written and flushed.  The
file
>should be completely intact.
>
>No UBIFS operations which change directory entries are not entirely
>synchronous.  There is a NAND-page-sized buffer which must be flushed.
>It is flushed every 5 seconds or so.  Otherwise you must do some kind of
>sync.
>
>I can only guess that that version of UBIFS is somehow broken.

Hi Adrian,

I tried some different versions from
git://git.infradead.org/~dedekind/ubifs-v2.6.27.git
and the problem is caused by commit " UBIFS: fix 64-bit divisions in debug
print " 
9d016dc4b3006ef3493b21442394028614e26da5 :

dbg_io("set timer for jhead %d, %llu millisecs", wbuf->jhead,
-       ktime_to_ns(wbuf->hardlimit)/USEC_PER_SEC);
-       hrtimer_start(&wbuf->timer, wbuf->hardlimit, HRTIMER_MODE_REL);
+       div_u64(ktime_to_ns(wbuf->hardlimit), USEC_PER_SEC)); 
}

As you can see the timer is no longer started. Could you please fix this ?

Thanks,

Ronny Dierckx
