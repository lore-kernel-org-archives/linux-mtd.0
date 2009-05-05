Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1HHg-0006GO-Nj
	for linux-mtd@lists.infradead.org; Tue, 05 May 2009 09:50:14 +0000
Received: by wf-out-1314.google.com with SMTP id 23so3398279wfg.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 May 2009 02:49:54 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 May 2009 11:49:54 +0200
Message-ID: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
Subject: mtdutils and libubiio
From: Corentin Chary <corentin.chary@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Some time ago we made libubiio available at :
http://git.iksaif.net/?p=libubiio.git;a=summary
I wanted to know how it can be used in mtd-utils, so we can start
making patch for inclusion into mtd-utils.
The first thing I see is mkfs.ubifs, using libubiio we will be able to
run mkfs on an ubi volume. I believe it's
simpler than creating a image, and using other tools to write it to the volume.
Where can libubiio be used ?

Another question, do you use static Makefiles for a reason ? Maybe we
could move to CMake ?
Thanks

-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org
