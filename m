Received: from nm18-vm0.bullet.mail.ird.yahoo.com ([77.238.189.215])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S2nEf-0006oJ-C8
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 17:22:42 +0000
Message-ID: <1330536159.1477.YahooMailClassic@web29014.mail.ird.yahoo.com>
Date: Wed, 29 Feb 2012 17:22:39 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFB4D94431.92097836-ONC12579B3.002C764D-C12579B3.00314167@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Wed, 29/2/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote=
:=0A> If erase is suspended, chip->state is changed which will=0A> keep the=
 function in=0A> the for(;;) loop. Once erase has been resumed again=0A> ch=
ip->state will change back.=0A> It seems to me that chip->state and SR.6 ar=
e mutally=0A> exclusive? I can not see how=0A> you can get to=0A>     statu=
s =3D map_read(map, cmd_adr);=0A>     if (map_word_andequal(map, status,=0A=
> status_OK, status_OK))=0A> if the the erase has been suspended.=0A=0AOK, =
I understand. Let me demonstrate.=0A=0AI Added the following debug to the o=
riginal linux-3.3-rc5=0Adrivers/mtd/chips/cfi_cmdset_0001.c file (i.e. with=
out my patch):=0A=0A--------=0A=0A797a798=0A> printk("%d: CRDY: about to Er=
ase Suspend adr=3D0x%08x\n", current->pid, adr);=0A958a960=0A> printk("%d: =
PUTC: enter\n", current->pid);=0A974a977=0A> printk("%d: PUTC: about to wak=
e_up (a)\n", current->pid);=0A988a992=0A> printk("%d: PUTC: about to wake_u=
p (b)\n", current->pid);=0A1005a1010=0A> printk("%d: PUTC: about to Erase R=
esume adr=3D0x%08x\n", current->pid, adr);=0A1025a1031=0A> printk("%d: PUTC=
: about to wake_up (c)\n", current->pid);=0A1216a1223=0A> printk("%d: WAIT:=
 call-state=3D%d, cmd_adr=3D0x%08x\n", current->pid, chip_state, cmd_adr);=
=0A1234a1242=0A> printk("%d: WAIT: about to suspend\n", current->pid);=0A12=
35a1244=0A> printk("%d: WAIT: resumed\n", current->pid);=0A1241a1251=0A> pr=
intk("%d: WAIT: status=3D0x%08x\n", current->pid, status.x[0]);=0A1257a1268=
=0A> printk("%d: WAIT: return -ETIME\n", current->pid);=0A1262a1274=0A> pri=
ntk("%d: WAIT: about to sleep: sleep_time=3D%d\n", current->pid, sleep_time=
);=0A1281a1294=0A> printk("%d: WAIT: return 0\n", current->pid);=0A1891a190=
5=0A> printk("%d: ERAS: adr=3D0x%08x\n", current->pid, adr);=0A=0A--------=
=0A=0AI rebooted my hx4700, saved the dmesg output, and edited and annotate=
d=0Awhat I feel to be the important messages:=0A=0A--------=0A=0A[    2.224=
667] 30: WAIT: status=3D0x00a000a0=0A[    2.224693] 30: WAIT: return 0=0A=
=0APID 30 has just failed FL_ERASING of block 0x00440000 for the 3rd time:=
=0Aerase has failed (SR.5 =3D 1).=0A=0A[    2.224719] block erase failed at=
 0x00440000: status 0xa000a0. Retrying...=0A=0AConfirmation of erase fail f=
rom elsewhere.=0A=0A[    2.224779] 30: ERAS: adr=3D0x00440000=0A[    2.2247=
98] 30: WAIT: call-state=3D4, cmd_adr=3D0x00440000=0A[    2.224814] 30: WAI=
T: status=3D0x00000000=0A[    2.224830] 30: WAIT: about to sleep: sleep_tim=
e=3D512000=0A=0APID 30 is now attempting FL_ERASING of block 0x00440000 for=
 the 4th time.=0A=0A[    2.492129] 76: CRDY: about to Erase Suspend adr=3D0=
x0060f748=0A[    2.492216] 76: PUTC: enter=0A[    2.492233] 76: PUTC: about=
 to Erase Resume adr=3D0x0060f748=0A=0APID 76 has issued Erase Suspend and =
Erase Resume (the address is irrelevant).=0APID 30 is still sleeping at thi=
s point.=0A=0A[    2.785235] 30: WAIT: status=3D0x00e800e8=0A[    2.785250]=
 30: WAIT: return 0=0A=0APID 30 has woken up to find:=0Abad F-VPP (SR.3 =3D=
 1),=0Aerase has failed (SR.5 =3D 1),=0AErase Suspend is in effect (SR.6 =
=3D 1).=0A=0A[    2.785276] physmap-flash: block erase error: (bad VPP)=0A=
=0AConfirmation of bad VPP from elsewhere.=0A=0A[    2.863384] 30: ERAS: ad=
r=3D0x00440000=0A[    2.863412] 30: WAIT: call-state=3D4, cmd_adr=3D0x00440=
000=0A[    2.863431] 30: WAIT: status=3D0x00c000c0=0A[    2.863444] 30: WAI=
T: return 0=0A=0APID 30 is now attempting FL_ERASING of block 0x00440000 fo=
r the 5th time:=0AErase Suspend is in effect (SR.6 =3D 1),=0Abut no errors,=
 so the erase seemingly succeeded.=0A=0A[    2.863543] 30: WAIT: call-state=
=3D8, cmd_adr=3D0x00440000=0A[    2.863562] 30: WAIT: status=3D0x00c000c0=
=0A[    2.863574] 30: WAIT: return 0=0A=0APID 30 is now attempting FL_WRITI=
NG_TO_BUFFER:=0AErase Suspend is in effect (SR.6 =3D 1),=0Abut no errors, s=
o the FL_WRITING_TO_BUFFER seemingly succeeded.=0A=0A[    2.863599] 30: WAI=
T: call-state=3D7, cmd_adr=3D0x00440000=0A[    2.863615] 30: WAIT: status=
=3D0x00d000d0=0A[    2.863628] 30: WAIT: return 0=0A=0APID 30 is now attemp=
ting FL_WRITING to block 0x00440000:=0AErase Suspend is in effect (SR.6 =3D=
 1),=0Aprogram has failed (SR.3 =3D 1).=0A=0A[    2.863649] physmap-flash: =
buffer write error (status 0xd000d0)=0A=0AConfirmation of write error from =
elsewhere.=0A=0A[    2.863703] UBI error: ubi_io_write: error -22 while wri=
ting 64 bytes to PEB 262:0, written 0 bytes=0A[    2.863728] UBI error: era=
se_worker: failed to erase PEB 262, error -22=0A[    2.863750] UBI warning:=
 ubi_ro_mode: switch to read-only mode=0A[    2.863770] UBI error: do_work:=
 work failed with error code -22=0A[    2.863791] UBI error: ubi_thread: ub=
i_bgt0d: work failed with error code -22=0A=0ABye bye UBI.=0A=0A--------=0A=
=0AFirst we note that the WAIT (inval_cache_and_wait_for_operation) functio=
n=0Anever suspends itself; i.e. it never prints "WAIT: about to suspend".=
=0A=0AThe message at:=0A[    2.863431] 30: WAIT: status=3D0x00c000c0=0Ashow=
s that WAIT found status_OK (SR.7) set and Erase Suspend in effect.=0A=0ANo=
w things get complicated.=0A=0AI repeated with exercise with my patch appli=
ed. This time the WAIT=0Afunction looped forever trying to erase the same b=
lock (0x00440000)=0Abecause the status never changed from 0x00e800e8 (rathe=
r like 2.785235=0Aabove, but with my patch now applied the function cannot =
return).=0A=0ADisheartened, I thought my patch had only succeeded in livelo=
cking the=0Afunction because of a hardware error.=0A=0AHowever, remembering=
 our version of the Heisenberg uncertainty principle -=0Athat adding debug =
sometimes changes the behaviour - I stripped out almost=0Aall of the debug =
and repeated the exercise. This time block 0x00440000=0Aerased successfully=
 without errors.=0A=0AWhere do we go from here?=0A=0AThe above debug demons=
trates that inval_cache_and_wait_for_operation()=0Acan return while Erase S=
uspend is in effect. My patch prevents that, and=0Afixes UBI for me.=0A=0AI=
 am open to the suggestion that my hx4700 exhibits random hardware=0Afailur=
es. This would explain the results. But I have a nagging doubt about=0Athat=
 because my bootloader has never reported erase errors (apart from once=0Aw=
hen I broke its erase block size table). As I mentioned previously, the=0Ab=
ootloader never suspends erase operations.=0A=0AI am open to the suggestion=
 that my patch merely fixes a symptom rather=0Athan an underlying cause.=0A=
=0ASo perhaps the MTD driver contains a race condition. The stripping out o=
f=0Adebug to fix the erase error tends to support that explanation.=0A=0AI =
don't know what else to say.=0A=0APaul=0A
