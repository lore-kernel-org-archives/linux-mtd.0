Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14a2U6-0003WI-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 21:25:38 +0000
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Bug in rpxlite.c ?
Date: Mon, 5 Mar 2001 22:21:51 +0100
Content-Type: text/plain
Cc: <mtd@infradead.org>
MIME-Version: 1.0
Message-Id: <01030522253302.04023@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I just stumbled over this line in rpxlite.c and I'm wondering if the "* ofs"
should really be a "+ ofs":

__u8 rpxlite_read8(struct map_info *map, unsigned long ofs)
{
    return readb(map->map_priv_1 * ofs);
}




----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
