Received: from eu1sys200aog108.obsmtp.com ([207.126.144.125])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ri0nC-0001LA-65
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2012 09:36:26 +0000
Message-ID: <4F02CC0C.8020203@st.com>
Date: Tue, 3 Jan 2012 15:06:12 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: 4k page ONFI NAND
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We have a Micron 4K page sized ONFI NAND MT29F16G08
I am encountering frequent errors while reading the device. Although the 
data area is protected for 8bit correction with BCH8 algorithm, the oob 
area is unprotected and is susceptible to bit flips

These errors are very frequent and it results in jffs2 file system 
mounting problems and other related issues

I also confirmed the problem through oobtest module.

Can you please suggest any solutions/workaround

Regards
Vipin
