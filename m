Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3Tzl-0000ss-Sz
 for linux-mtd@lists.infradead.org; Tue, 23 Dec 2014 18:15:46 +0000
Received: by mail-qg0-f42.google.com with SMTP id q108so4935103qgd.15
 for <linux-mtd@lists.infradead.org>; Tue, 23 Dec 2014 10:15:22 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 23 Dec 2014 23:45:22 +0530
Message-ID: <CAGnW=BbmpJqvbuznhxXsfZYz0wWMOQ851f+E3hWrAawOSZWtpQ@mail.gmail.com>
Subject: nand ecc
From: punnaiah choudary kalluri <kalluripunnaiahchoudary@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: Punnaiah Choudary <kpc528@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  I have the following confusions regarding the nand ecc algorithms:
Haming and BCH

Request your help to clarify the below concerns.

Hamming  Mode:
   What will happen if the data has more than two bit errors for codeword?
   Will the nand_correct_data() function returns uncorrectable ecc error ?

BCH mode:
 Assume that the BCH block can correct upto 24bit errors. what will
happen if the data
has more than 24 bit errors?
Will the nand_bch_correct_data() function returns uncorrectable ecc error?


Regards,
Punnaiah
