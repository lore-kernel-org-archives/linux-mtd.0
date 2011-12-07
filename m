Received: from nm27.bullet.mail.sp2.yahoo.com ([98.139.91.97])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RYLJD-0004lN-8N
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 17:29:32 +0000
Message-ID: <1323278916.12142.YahooMailNeo@web114614.mail.gq1.yahoo.com>
Date: Wed, 7 Dec 2011 09:28:36 -0800 (PST)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Back-porting latest code to Blackfin 2.6.34.7-ADI-2010R1
To: MTD Mailing List <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Reginald Perrin <reggyperrin@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,=0A=0AWe're using 2.6.34.7 from ADI without modification (meaning =
ADI's version). =A0When I check this version against the=A0ubifs-v2.6.34.gi=
t that's the "official" version, there are definitely differences.=0A=0ADoe=
s anybody know the status of the .34 tree and the reliability (I'm asking t=
his same question @ ADI)? =A0Specifically, we're fighting corruption issues=
, trying to track down what might be corrupting the LEB structure.=0A=0ATIA=
=0ARP=A0
