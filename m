Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B1MzC-0005Lf-3G
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2004 10:00:18 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <joris.lammers@pandora.be>, <linux-mtd@lists.infradead.org>
Date: Thu, 11 Mar 2004 10:59:53 +0100
Message-ID: <004001c4074f$99fd6d70$0a01a8c0@LUMENTIS02>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <W418732572587941078942088@asteria.telenet-ops.be>
Subject: RE: Failed to garbage collect: ENOSPC
Reply-To: joakim.tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Only way to get out of this is to remove the log file that=20
> was written to most. This file is then about 200kB in size=20
> but after removal the free space of the partition grows from=20
> 124kB to 2MB! Apparently there was dirty space to collect?

The JFFS2 overhead from small writes is rather big. Each write is its =
own node in
flash so a 124kB log file can be 2MB on flash. If you copy the log file =
and delete the
old file, you will free flash space.

 Jocke
