Received: from f144.pav1.hotmail.com ([64.4.31.144] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188c5P-0005SV-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2002 07:55:51 +0000
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: mtd2 partition mapping on mtd1?...
Date: Mon, 04 Nov 2002 08:25:37 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F144tdrNLa1Um2n8jey00002d52@hotmail.com>
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

Jörn,

A correction. On further checking thru BDM device, am seeing that the
mapping is OK. Only the write's are failing...
After setting the proper unlock commands and writing the first 32bits,
its reading back the same location and looping in that read. After some
time (out?), its coming out, sometimes with Input/output error.
Something unexpected is dd from /dev/zero seems to go thru...

In my partitions table have not set any mask_flags and am using
physmap.c with partition table and add/del _mtd_partitions() calls
added.

Any advice on how to go about this?.

Thanks and Regards,
Vijay


_________________________________________________________________
Internet access plans that fit your lifestyle -- join MSN. 
http://resourcecenter.msn.com/access/plans/default.asp
