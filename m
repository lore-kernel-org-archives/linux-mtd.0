Received: from e31.co.us.ibm.com ([32.97.110.149])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GlYtd-0002c8-AD
	for linux-mtd@lists.infradead.org; Sat, 18 Nov 2006 17:42:55 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kAIMgfdS031915
	for <linux-mtd@lists.infradead.org>; Sat, 18 Nov 2006 17:42:41 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kAIMgfbx243156
	for <linux-mtd@lists.infradead.org>; Sat, 18 Nov 2006 15:42:41 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kAIMgeNQ008267
	for <linux-mtd@lists.infradead.org>; Sat, 18 Nov 2006 15:42:41 -0700
Subject: Re: compression tests in jffs2
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: =?ISO-8859-1?Q?Mat=EDas_Zabalj=E1uregui?= <matiasz@info.unlp.edu.ar>
In-Reply-To: <20061118133527.8kxy5bxog0084w88@ada.info.unlp.edu.ar>
References: <20061117190637.2fgiinwlz4wswso0@ada.info.unlp.edu.ar>
	<1163853879.5597.54.camel@sauron>
	<20061118133527.8kxy5bxog0084w88@ada.info.unlp.edu.ar>
Content-Type: text/plain; charset=utf-8
Date: Sat, 18 Nov 2006 16:42:49 -0600
Message-Id: <1163889770.20835.6.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-11-18 at 13:35 -0300, Matías Zabaljáuregui wrote:
> OK! Thank you for your answer
> 
> >
> >> - recompiling the jffs2 module is the only way to reconfigure the
> >> compression behaviour?
> >
> > Yes at the moment. But adding dynamic and per-file compression so would
> > cool.
> >
> 
> Do you think a /proc entry is a suitable mecanism for runtime  
> compression configuration?

Please avoid /proc for anything.  The compression type has nothing to do
with processes, so it doesn't belong in /proc.

I would suggest either using a mount option if you want to make the
whole filesystem use a particular type of compression, or use xattrs to
specify compression type on a per file basis.  A third option would be
to use a sysfs entry similar to how you would use /proc.

josh
