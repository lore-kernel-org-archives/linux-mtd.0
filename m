Received: from web37604.mail.mud.yahoo.com ([209.191.87.87])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ngg3f-0000TR-11
	for linux-mtd@lists.infradead.org; Sun, 14 Feb 2010 15:06:55 +0000
Message-ID: <559624.1287.qm@web37604.mail.mud.yahoo.com>
Date: Sun, 14 Feb 2010 07:06:49 -0800 (PST)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Legacy memstick support + FTL questions
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1266091737.30330.16.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

> =0A> =0A> I would like to know more about the registers.=0A> =0A> =0A> st=
ruct ms_status_register {=0A> =A0=A0=A0 unsigned char reserved;=0A> =A0=A0=
=A0 unsigned char interrupt;=0A=0A* command can not be executed=0A> #define=
 MEMSTICK_INT_CMDNAK 0x01=0A=0A* MS IO stuff. Probably superseded by Pro IO=
 protocol.=0A> #define MEMSTICK_INT_IOREQ=A0 0x08=0A> #define MEMSTICK_INT_=
IOBREQ 0x10=0A=0A* card is ready for data transfer (actual read/write block=
 data)=0A> #define MEMSTICK_INT_BREQ=A0=A0=A00x20=0A=0A* some error occured=
=0A> #define MEMSTICK_INT_ERR=A0 =A0 0x40=0A=0A* command completed (either =
successfully or erroneously)=0A> #define MEMSTICK_INT_CED=A0 =A0 0x80=0A> =
=0A> =A0=A0=A0 unsigned char status0;=0A=0A* media is write protected=0A> #=
define MEMSTICK_STATUS0_WP=A0 0x01=0A=0A* media is sleeping (not very usefu=
l, as far as I can see)=0A> #define MEMSTICK_STATUS0_SL=A0 0x02=0A=0A* medi=
a buffer full (used when reading)=0A> #define MEMSTICK_STATUS0_BF=A0 0x10=
=0A=0A* media buffer empty (used when writing)=0A> #define MEMSTICK_STATUS0=
_BE=A0 0x20=0A=0A* flash busy=0A> #define MEMSTICK_STATUS0_FB0 0x40=0A=0A* =
media busy (applies to built-in controller)=0A> #define MEMSTICK_STATUS0_MB=
=A0 0x80=0A> =0A> =A0=A0=A0 unsigned char status1;=0A=0A=0A* uncorrectable =
flag error=0A> #define MEMSTICK_STATUS1_UCFG 0x01=0A=0A* flag error (applie=
s to "overwrite flag" field in extra data)=0A> #define MEMSTICK_STATUS1_FGE=
R 0x02=0A=0A* uncorrectable extra data error=0A> #define MEMSTICK_STATUS1_U=
CEX 0x04=0A=0A* extra data (oob) error=0A> #define MEMSTICK_STATUS1_EXER 0x=
08=0A=0A* uncorrectable data error (single bit errors are correctable)=0A> =
#define MEMSTICK_STATUS1_UCDT 0x10=0A=0A* data error=0A> #define MEMSTICK_S=
TATUS1_DTER 0x20=0A=0A* flash busy (if media is busy, FB1 is not set, but F=
B0 is, the stick is=0Ain invalid state)=0A> #define MEMSTICK_STATUS1_FB1=A0=
 0x40=0A=0A* media busy (same meaning as in status0)=0A> #define MEMSTICK_S=
TATUS1_MB=A0=A0=A00x80=0A> } __attribute__((packed));=0A> =0A> Could you ex=
plain meaning of these flags?=0A> I understand some but not all.=0A=0A> =0A=
> Hardware register #16 (on my reader) seems to hold some=0A> status flags =
as well,=0A> It is interesting that there are many status flags, and=0A> th=
ey don't seem=0A> to fit nether jmicron nor TI flag register=0A> This regis=
ter is polled to wait after an TPC, but several=0A> different bits are poll=
ed=0A> I thought that there is a relation between it and memstick=0A> statu=
s register.=0A=0AIt is quite possible. Some controllers will automatically =
retrieve an=0A"interrupt" field from the status register on each media acce=
ss (in fact,=0Athis behavior is mandated in parallel mode). Check if the bi=
ts fit "inter-=0Arupt" register bits.=0A=0A> =0A> struct ms_id_register {=
=0A> =A0=A0=A0 unsigned char type;=0A> =A0=A0=A0 unsigned char if_mode;=0A>=
 =A0=A0=A0 unsigned char category;=0A> =A0=A0=A0 unsigned char class;=0A> }=
 __attribute__((packed));=0A> =0A> This register set is used to determine a=
ll kinds of=0A> things,=0A> could you explain its meaning?=0A=0AThis is an =
informal media id register. The mess you can see with its field=0Avalues is=
 caused purely by Sony's inability to make its mind.=0AYou can use it to di=
fferentiate between legacy, Pro and IO devices, but=0Athat's roughly it.=0A=
=0A> =0A> =0A> struct ms_param_register {=0A> =A0=A0=A0 unsigned char syste=
m;=0A=0A* 0 - serial, 1 - parallel mode=0A> #define MEMSTICK_SYS_PAM=A0 0x0=
8=0A=0A* always 1 on legacy sticks=0A> #define MEMSTICK_SYS_BAMD 0x80=0A=0A=
> These correspond to parallel and serial modes, right?=0A> There seems to =
be a large dance around switching these=0A> modes.=0A> You seem to mention =
8 bit serial mode. How that could be=0A> possible?=0A> =0A=0AMS Pro HG stic=
ks have 8bit capability as well as extended address space.=0AEach of the da=
ta pads on such sticks is split in two.=0A=0A* physical block address =0A> =
=A0=A0=A0 unsigned char block_address[3];=0A=0A* block access mode modifier=
=0A> =A0=A0=A0 unsigned char cp;=0A=0A* read/write data + extra data and au=
toincrement page address pointer=0A> #define MEMSTICK_CP_BLOCK=A0 =A0=A0=A0=
0x00=0A=0A* read/write data + extra data and stay at the same page=0A> #def=
ine MEMSTICK_CP_PAGE=A0 =A0 =A0 0x20=0A=0A* read/write extra data only and =
stay at the same page=0A> #define MEMSTICK_CP_EXTRA=A0 =A0=A0=A00x40=0A=0A*=
 read/write flag area and stay at the same page=0A> #define MEMSTICK_CP_OVE=
RWRITE 0x80=0A> I have rough idea what that means, but an explanation won't=
=0A> hurt.=0A> Especially MEMSTICK_CP_OVERWRITE=0A=0AThe idea is that "over=
write flag" field in the extra data area can be=0Aaccessed separately, has =
its own error correction logic and otherwise=0Abehaves as a separate entity=
 (it even has dedicated bits in the status1=0Aregister). This field is used=
 by software to store advisory information=0Aand to aid recovery from inter=
rupted flash operations.=0A=0A* page address within block=0A> =A0=A0=A0 uns=
igned char page_address;=0A> } __attribute__((packed));=0A> =0A> =0A> struc=
t ms_extra_data_register {=0A> =A0=A0=A0 unsigned char=A0 overwrite_flag;=
=0A=0A* 1 - block is stable, 0 - block is being updated=0AThis bit can be r=
eset on blocks which are scheduled for relocation/update.=0AIf operation in=
 question is abruptly terminated, information in this bit=0Ashould assist i=
n subsequent restoration of media's logical integrity.=0A> #define MEMSTICK=
_OVERWRITE_UDST=A0 0x10=0A=0A* 3 - page is ok, 2/1 - page should not be acc=
essed, 0 - page can be=0Aaccessed, but its data integrity can not be assure=
d=0A> #define MEMSTICK_OVERWRITE_PGST1 0x20=0A> #define MEMSTICK_OVERWRITE_=
PGST0 0x40=0A=0A* 1 - block is ok, 0 - block should not be accessed=0A> #de=
fine MEMSTICK_OVERWRITE_BKST=A0 0x80=0A> =0A=0A* This register does not see=
m to be very useful. It is used to specify=0Athat page in question has spec=
ial meaning, which mostly applies to DRM=0Aimplementations (superseded by M=
S Pro) or severely RAM restricted systems.=0A> =A0=A0=A0 unsigned char=A0 m=
anagement_flag;=0A=0A* page is used for system purposes (?)=0A> #define MEM=
STICK_MANAGEMENT_SYSFLG 0x04=0A=0A* page is used to store temporary physica=
l to logical mapping table=0A> #define MEMSTICK_MANAGEMENT_ATFLG=A0 0x08=0A=
=0A* DRM crap=0A> #define MEMSTICK_MANAGEMENT_SCMS1=A0 0x10=0A> #define MEM=
STICK_MANAGEMENT_SCMS0=A0 0x20=0A> =0A=0A* logical address of the block (mu=
st obey zoning restrictions)=0AEach zone has 512 physical blocks.=0AThe ver=
y first zone is only allowed 494 logical blocks, all other have=0A496 logic=
al blocks. The rest of the physical blocks in each zone are used=0Aas spare=
s and must be reused within the zone boundaries.=0A> =A0=A0=A0 unsigned sho=
rt logical_address;=0A> } __attribute__((packed));=0A> =0A> Same here, mang=
ement flag seems to be used often by=0A> driver.=0A=0AManagement flag shoul=
d not be used at all. The only possible use for it=0A(apart from DRM) is to=
 mark volatile pages which can be used to store the=0Ablock look-up table. =
If there's enough RAM, no such tricks are necessary.=0ADefault value for th=
e unused flags is 0xff and it better be set.=0A=0AOn the other hand, overwr=
ite flag should be used quite extensively.=0A=0A=0A> =0A> =0A> struct ms_re=
gister {=0A> =A0=A0=A0 struct ms_status_register=A0=0A> =A0=A0=A0status;=0A=
> =A0=A0=A0 struct ms_id_register=A0 =A0=0A> =A0 =A0=A0=A0id;=0A> =A0=A0=A0=
 unsigned char=A0 =A0 =A0 =A0=0A> =A0 =A0 =A0 =A0=A0=A0reserved0[8];=0A> =
=A0=A0=A0 struct ms_param_register=A0 =A0=0A> =A0 param;=0A> =A0=A0=A0 stru=
ct ms_extra_data_register=0A> extra_data;=0A> =A0=A0=A0 unsigned char=A0 =
=A0 =A0 =A0=0A> =A0 =A0 =A0 =A0=A0=A0reserved1[2]; /* pad=0A> to word bound=
ary */=0A> }=0A> I guess that first two fields of ms_extra_data_register=0A=
> should belong to =0A> ms_param_register, for alignment.=0A=0ANo. They are=
 separate hardware registers on the media side, and the=0Aoffsets are like =
this.=0A=0A> Also, I don't get why status register has so many flags.=0A> A=
s I understand it, TPCs are send in both directions, and=0A> nothing more.=
=0A> There are no dedicated lines, or something like that.=0A=0ATPC means "=
transport protocol command" and it is only send from host to=0Amedia. Gener=
ally speaking, the whole thing works like this (each point=0Ais a TPC):=0A=
=0A1. Host selects media register access window.=0A2. Host modifies media r=
egister values.=0A3. Host invokes media command.=0A4. Host reads media regi=
sters.=0A5. Host moves data around.=0A6. Lather, rinse, repeat.=0A=0A> =0A>=
 So status should be a content of the answer TPC or=0A> something like that=
.=0A=0AIt is not.=0A=0A> =0A> =0A> I wish I had the memstick spec (original=
 not pro)=0A> =0A=0AThere's an email address on Sony's website.=0A=0A=0A=0A=
      _____________________________________________________________________=
_____________=0AYahoo!7: Catch-up on your favourite Channel 7 TV shows easi=
ly, legally, and for free at PLUS7. www.tv.yahoo.com.au/plus7
