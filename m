Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1615lj-0007rJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 12:55:55 +0000
Received: from gromit (gromit.house [192.168.1.133])
	by gateway.house (8.11.6/8.11.2) with SMTP id fA6D3bs29611
	for <linux-mtd@lists.infradead.org>; Tue, 6 Nov 2001 08:03:38 -0500
Message-ID: <003e01c166c3$ca707cb0$8501a8c0@gromit>
From: "Michael Rothwell" <rothwell@holly-springs.nc.us>
To: <linux-mtd@lists.infradead.org>
References: <15375.1005031664@redhat.com> <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se> <20011106131316.A15512@wohnheim.fh-wedel.de>
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
Date: Tue, 6 Nov 2001 08:06:03 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> Hmm. BTW, is it just me, or do other peaople agree,
> that the j in jffs is a bug? Journaling has little
> to do with a log-structure.

Well, you can think of a log-structured filesystem as "all journal," so the
"J" applies.
