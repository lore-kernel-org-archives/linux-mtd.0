Received: from [88.191.21.22] (helo=island.wyplay.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NMmJ8-0005AF-5a
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 17:44:39 +0000
Received: from localhost (Island [127.0.0.1])
	by island.wyplay.net (Postfix) with ESMTP id C83D0A94315
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 18:14:49 +0000 (GMT)
Received: from island.wyplay.net ([127.0.0.1])
	by localhost (island.wyplay.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEDc5+1RU+WT for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 18:14:49 +0000 (GMT)
Received: from grimoire.wyplay.com (grimoire.wyplay.int [192.168.3.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by island.wyplay.net (Postfix) with ESMTP id 1C75CA941D4
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 18:14:49 +0000 (GMT)
Received: from localhost (localhost.wyplay.com [127.0.0.1])
	by grimoire.wyplay.com (Postfix) with ESMTP id 013006A84EF
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 17:49:59 +0100 (CET)
Received: from grimoire.wyplay.com ([127.0.0.1])
	by localhost (grimoire.wyplay.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uN6DhM2l3csh for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 17:49:58 +0100 (CET)
Received: from [172.16.4.200] (lauren.mm.wyplay.int [172.16.4.200])
	by grimoire.wyplay.com (Postfix) with ESMTP id 8067B6A84EF
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 17:49:58 +0100 (CET)
Message-ID: <4B2FA658.6010407@wyplay.com>
Date: Mon, 21 Dec 2009 17:46:16 +0100
From: Lauren Del Giudice <lauren@wyplay.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBI - exclude bootloader blocks from wear levelling 
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm new to UBI... I understood that static wear levelling is applied
accross the whole device (a NAND device in my case); If so, how can
I exclude blocks reserved for the bootloader from wear levelling?

Thanks for your help,
Lauren.
----
This message contains confidential information and may contain information that is legally privileged.  If you have received this message by mistake, please immediately notify us and delete the original message. Thank you.  

Ce message contient des informations confidentielles.  S'il vous est parvenu par erreur, merci de bien vouloir nous en aviser par retour, de n'en faire aucun usage et de n'en garder aucune copie.
----
