Received: from mail-ew0-f209.google.com ([209.85.219.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MilKz-0001VS-2j
	for linux-mtd@lists.infradead.org; Wed, 02 Sep 2009 08:37:10 +0000
Received: by ewy5 with SMTP id 5so532832ewy.27
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Sep 2009 01:37:03 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 2 Sep 2009 10:37:02 +0200
Message-ID: <eedb5540909020137v7e3ced03s9c252949d27d20ca@mail.gmail.com>
Subject: Why not include FORCE_WORD_WRITE option in menuconfig ?
From: javier Martin <javier.martin@vista-silicon.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I was wondering if there would be any inconvenient on adding
FORCE_WORD_WRITE define to menuconfig so that the user could choose if
he wants to use only word writes in both cfi_cmd0002/0001 .

I would happily send a patch for that purpose unless anyone see any
inconvenience on the idea.

Thank you.
-- 
Javier Martin
Vista Silicon S.L.
CDTUC - FASE C - Oficina S-345
Avda de los Castros s/n
39005- Santander. Cantabria. Spain
+34 942 25 32 60
www.vista-silicon.com
