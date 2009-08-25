Received: from n12-vm0.bullet.mail.in.yahoo.com ([202.86.4.246])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mfnzt-0002kG-EB
	for linux-mtd@lists.infradead.org; Tue, 25 Aug 2009 04:51:10 +0000
Message-ID: <231717.78385.qm@web94806.mail.in2.yahoo.com>
References: <c260b4940908241158m5565f682ped4a908c6998cef8@mail.gmail.com>
Date: Tue, 25 Aug 2009 10:21:00 +0530 (IST)
From: Radha Mohan <radhamohan_ch@yahoo.com>
Subject: Re: Write to NOR flash garbled
To: N Cheung <brjerome.1@gmail.com>, linux-mtd@lists.infradead.org
In-Reply-To: <c260b4940908241158m5565f682ped4a908c6998cef8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,=0A=0ACan you list out the errors that you are getting? =0AI also faced =
some problem with Spansion S29GL064M90TAIR4NOR flash. In my case the=0Asect=
or erase was not happening immediately after giving the command. So with th=
at I saw=0Asome Data CRC and Node CRC errors.=0ASo I put a retry in the cod=
e where erase was failing (cfi_cmdset0002.c). And also I disabled=0Athe buf=
fered write.=0A=0A-- Mohan=0A=0A=0A=0A----- Original Message ----=0AFrom: N=
 Cheung <brjerome.1@gmail.com>=0ATo: linux-mtd@lists.infradead.org=0ASent: =
Tuesday, 25 August, 2009 12:28:28 AM=0ASubject: Write to NOR flash garbled=
=0A=0AThis device, a Micrel KS8695 based system with Linux 2.6.18 with AMD=
=0AAm29LV641DH.  Device running find for 2 years until switch to a=0Acompat=
ible Spansion NOR flash S29GL064N.=0A=0Aflashcp failed with error: File doe=
s not seem to match flash data.=0AFirst mismatch at 0x00000000-0x00002800=
=0A=0AUse dd to copy a one line text file, we can read it back OK.  But wit=
h=0Aa bigger (200 lines) text file, the data get garbled.=0A=0AHowever, if =
MTD debug is set to verbosity=3D3, flashcp copied big files=0Awithout probl=
em.=0A=0AAny pointers will be greatly appreciated.=0A=0AThanks in advance,=
=0ANorman=0A=0A______________________________________________________=0ALin=
ux MTD discussion mailing list=0Ahttp://lists.infradead.org/mailman/listinf=
o/linux-mtd/=0A=0A=0A=0A      Looking for local information? Find it on Yah=
oo! Local http://in.local.yahoo.com/
