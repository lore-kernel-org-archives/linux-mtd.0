Received: from moutvdomng1.kundenserver.de ([212.227.126.181])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AATH-00067n-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 15:18:39 +0100
Received: from [195.20.224.204] (helo=mrvdom00.kundenserver.de)
	by moutvdomng1.kundenserver.de with esmtp (Exim 3.22 #2)
	id 17AATF-0005kZ-00
	for linux-mtd@lists.infradead.org; Tue, 21 May 2002 16:18:37 +0200
Received: from [217.81.61.34] (helo=comm.esd-electronics.com)
	by mrvdom00.kundenserver.de with esmtp (Exim 2.12 #3)
	id 17AAKy-0005Qg-00
	for linux-mtd@lists.infradead.org; Tue, 21 May 2002 16:10:04 +0200
From: "Stefan Roese" <stefan.roese@esd-electronics.com>
To: <linux-mtd@lists.infradead.org>
Subject: SST Flash Support (SST39VF160)
Date: Tue, 21 May 2002 16:08:31 +0200
Message-ID: <EFEAIMDCOOOHIEPHDNFJIELDDPAA.stefan.roese@esd-electronics.com>
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

Hi,

I am right now struggeling with mtd and sst flash chips (39VF160) support.
The amd devices (am29lv160) work without problems.

My question: The file "amd_flash.c" contains some defines for SST flash
chips, but they are never used. Is this because some problems occured, or
because nobody had the time to fully implement the sst support.

Best regards,
Stefan.
