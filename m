Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BaxOM-0004g5-B4
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 09:57:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by mailgate.sysgo.de (Postfix) with ESMTP id 7CC0647B9A
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Jun 2004 15:56:49 +0200 (CEST)
Received: from donald.sysgo.com (unknown [172.20.1.30])
	by mailgate.sysgo.de (Postfix) with ESMTP id 715D547B9A
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Jun 2004 15:56:49 +0200 (CEST)
Message-ID: <40D1A1F2.1000103@sysgo.com>
Date: Thu, 17 Jun 2004 15:51:46 +0200
From: =?ISO-8859-1?Q?Oliver_K=FChlert?= <oliver.kuehlert@sysgo.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: mag@sysgo.com, rof@sysgo.com, acs@sysgo.com
Subject: chip driver mar_ram.c never sets MTD_ERASE_DONE state
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hello,

trying to erase on an mtd devices using the map_ram.c driver
blocks the current process and never wakes up. (see mtdchar.c, ioctl func=
)

I believe, that this can be fixed by adding the marked line in map_ram.c:


static int mapram_erase (struct mtd_info *mtd, struct erase_info *instr)
{
         /* Yeah, it's inefficient. Who cares? It's faster than a _real_
            flash erase. */
         struct map_info *map =3D (struct map_info *)mtd->priv;
         unsigned long i;

         for (i=3D0; i<instr->len; i++)
                 map_write8(map, 0xFF, instr->addr + i);

!!!!!!---->   instr->state =3D MTD_ERASE_DONE;   <----- !!!!!!

         if (instr->callback)
                 instr->callback(instr);

         return 0;
}

Best regards, Oliver K=FChlert


--=20
Dr. Oliver Kuehlert          SYSGO Real-Time Solutions AG
oliver.kuehlert@sysgo.com
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.co=
m
