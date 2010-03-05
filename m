Received: from aa012msr.fastwebnet.it ([85.18.95.72])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nnf96-0001lQ-U3
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 21:33:25 +0000
Received: from aurio02.aurion-tech.com (39.225.70.39) by
	aa012msr.fastwebnet.it (8.5.016.6)
	id 4B869E1101404B96 for linux-mtd@lists.infradead.org;
	Fri, 5 Mar 2010 22:33:19 +0100
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Hi All,  problem with SST39VF6401B70
Date: Fri, 5 Mar 2010 22:34:47 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201003052234.47983.fabio.giovagnini@aurion-tech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All.
This is my problem
I'musing SST39VF6401B70 as a boot NOR flash; when gen_probe module 
check_cmd_set function is called detect my flash as an AMDSTD and this 
because of CFI Query struct bytes 13H and 14H  (Primary OEM commad set) is 
0002H, 0000H as an AMD standard; but CFI Query struct bytes 15H and 16H 
(Address for Primary Extended Table) is 0000H (no table); this is not conform 
to ADMSTD. How can I solve the problem? Do I have to implement a different 
driver and if yes where can I find the road map?

Thanks a lot

-- 
Fabio Giovagnini

Aurion s.r.l.
CF e P.IVA 00885711200
Tel. +39.051.594.78.24
Cell. +39.335.8350919

www.aurion-tech.com

account telefono VoIP skype (www.skype.com):
aurion.giovagnini
