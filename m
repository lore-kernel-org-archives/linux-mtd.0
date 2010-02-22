Received: from web37607.mail.mud.yahoo.com ([209.191.87.90])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjYtg-0006F5-Lq
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 14:04:33 +0000
Message-ID: <597490.7198.qm@web37607.mail.mud.yahoo.com>
Date: Mon, 22 Feb 2010 06:04:26 -0800 (PST)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Legacy memstick support + FTL questions
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1266792159.3445.9.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> =0A> Alex, could you explain how a single TPC is performed?=0A> =0A> I cu=
rrently first send MS_TPC_SET_RW_REG_ADRS, and then=0A> MS_TPC_READ_REG=0A>=
 =0A> When I send the TPC I specify both the tpc number and its=0A> len. Is=
 the=0A> len transmitted?=0A=0AOf course, it is. How otherwise media would =
know how many bits to sample=0Ain?=0A=0A> =0A> I see that if I set addr.r_l=
ength !=3D MS_TPC_READ_REG len, I=0A> get errors=0A> in reg #16, but differ=
ent errors depending if i set it=0A> lower or higher.=0A=0AThis is an undef=
ined behavior. You're confusing the state machine on the=0Amedia side. By t=
he way, left over bytes from the incorrectly ordered=0Aor formatted TPC can=
 spill into block data buffer (this will cause an=0Aapparent data corruptio=
n - I've seen this happen).=0A=0A> =0A> Currently I think that a level chan=
ge on the #SDIO is the=0A> signal for=0A> host to start reading, but who se=
ts the #BS to high? Host=0A> or card.=0A=0ABS line is always mastered by ho=
st.=0A=0A> =0A> Does card signal end of transmission?=0A> =0A=0AYes, on a d=
ata line (there's CRC as well, which must be handled by the host=0Atranspar=
ently).=0A=0A> Also it seems that if I write to 'param' register, I can't=
=0A> read it back=0A> (maybe I do something wrong). Is this register write =
only?=0A> =0A=0AThere are no write only registers in the MS spec. Moreover,=
 you need to =0Aread the param register if you're doing multi-page transfer=
 (page address=0Awill be updated during the transfer to point to the last a=
ccessed page).=0A=0A=0A=0A      
