Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDES7-0006xw-0s
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 10:50:57 +0000
Received: by wwi17 with SMTP id 17so1000174wwi.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Nov 2010 03:50:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093EEF9923@Cloud.RL.local>
References: <AANLkTimGScstLNC2Hs1v-h6BF0y8GFTw4TJw8JEt+j8X@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE093EEF9923@Cloud.RL.local>
Date: Tue, 2 Nov 2010 16:20:52 +0530
Message-ID: <AANLkTi=ON7CSbGq=X9wOBNcNjY05-ECJzpjxXFiE0fQM@mail.gmail.com>
Subject: RE: [PATCH] trivial: nandsim.c spell fixes in comments
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: multipart/mixed; boundary=001485f1e72ad9d32404940fb2fe
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001485f1e72ad9d32404940fb2fe
Content-Type: multipart/alternative; boundary=001485f1e72ad9d31e04940fb2fc

--001485f1e72ad9d31e04940fb2fc
Content-Type: text/plain; charset=ISO-8859-1

attached patch fixes the program->programm and other  spellfixes in comments
in nandsim.c

Signed-off-by: srimugunthan  <srimugunthan.dhandapani@gmail.com>

-----
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index a6a73aa..c45e06f 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -210,12 +210,12 @@ MODULE_PARM_DESC(bbt,         "0 OOB, 1 BBT with
marker in OOB, 2 BBT with marker in d
 #define STATE_CMD_READ0        0x00000001 /* read data from the beginning
of page */
 #define STATE_CMD_READ1        0x00000002 /* read data from the second half
of page */
 #define STATE_CMD_READSTART    0x00000003 /* read data second command
(large page devices) */
-#define STATE_CMD_PAGEPROG     0x00000004 /* start page programm */
+#define STATE_CMD_PAGEPROG     0x00000004 /* start page program */
 #define STATE_CMD_READOOB      0x00000005 /* read OOB area */
 #define STATE_CMD_ERASE1       0x00000006 /* sector erase first command */
 #define STATE_CMD_STATUS       0x00000007 /* read status */
 #define STATE_CMD_STATUS_M     0x00000008 /* read multi-plane status (isn't
implemented) */
-#define STATE_CMD_SEQIN        0x00000009 /* sequential data imput */
+#define STATE_CMD_SEQIN        0x00000009 /* sequential data input */
 #define STATE_CMD_READID       0x0000000A /* read ID */
 #define STATE_CMD_ERASE2       0x0000000B /* sector erase second command */
 #define STATE_CMD_RESET        0x0000000C /* reset */
@@ -230,7 +230,7 @@ MODULE_PARM_DESC(bbt,         "0 OOB, 1 BBT with marker
in OOB, 2 BBT with marker in d
 #define STATE_ADDR_ZERO        0x00000040 /* one byte zero address was
accepted */
 #define STATE_ADDR_MASK        0x00000070 /* address states mask */

-/* Durind data input/output the simulator is in these states */
+/* During data input/output the simulator is in these states */
 #define STATE_DATAIN           0x00000100 /* waiting for data input */
 #define STATE_DATAIN_MASK      0x00000100 /* data input states mask */

@@ -248,7 +248,7 @@ MODULE_PARM_DESC(bbt,         "0 OOB, 1 BBT with marker
in OOB, 2 BBT with marker in d

 /* Simulator's actions bit masks */
 #define ACTION_CPY       0x00100000 /* copy page/OOB to the internal buffer
*/
-#define ACTION_PRGPAGE   0x00200000 /* programm the internal buffer to
flash */
+#define ACTION_PRGPAGE   0x00200000 /* program the internal buffer to flash
*/
 #define ACTION_SECERASE  0x00300000 /* erase sector */
 #define ACTION_ZEROOFF   0x00400000 /* don't add any offset to address */
 #define ACTION_HALFOFF   0x00500000 /* add to address half of page */
@@ -263,18 +263,18 @@ MODULE_PARM_DESC(bbt,         "0 OOB, 1 BBT with
marker in OOB, 2 BBT with marker in d
 #define OPT_PAGE512      0x00000002 /* 512-byte  page chips */
 #define OPT_PAGE2048     0x00000008 /* 2048-byte page chips */
 #define OPT_SMARTMEDIA   0x00000010 /* SmartMedia technology chips */
-#define OPT_AUTOINCR     0x00000020 /* page number auto inctimentation is
possible */
+#define OPT_AUTOINCR     0x00000020 /* page number auto incrementation is
possible */
 #define OPT_PAGE512_8BIT 0x00000040 /* 512-byte page chips with 8-bit bus
width */
 #define OPT_PAGE4096     0x00000080 /* 4096-byte page chips */
 #define OPT_LARGEPAGE    (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 & 4096-byte
page chips */
 #define OPT_SMALLPAGE    (OPT_PAGE256  | OPT_PAGE512)  /* 256 and 512-byte
page chips */

-/* Remove action bits ftom state */
+/* Remove action bits from state */
 #define NS_STATE(x) ((x) & ~ACTION_MASK)

 /*
  * Maximum previous states which need to be saved. Currently saving is
- * only needed for page programm operation with preceeded read command
+ * only needed for page program operation with preceded read command
  * (which is only valid for 512-byte pages).
  */
 #define NS_MAX_PREVSTATES 1
@@ -380,16 +380,16 @@ static struct nandsim_operations {
     /* Read OOB */
     {OPT_SMALLPAGE, {STATE_CMD_READOOB | ACTION_OOBOFF, STATE_ADDR_PAGE |
ACTION_CPY,
             STATE_DATAOUT, STATE_READY}},
-    /* Programm page starting from the beginning */
+    /* Program page starting from the beginning */
     {OPT_ANY, {STATE_CMD_SEQIN, STATE_ADDR_PAGE, STATE_DATAIN,
             STATE_CMD_PAGEPROG | ACTION_PRGPAGE, STATE_READY}},
-    /* Programm page starting from the beginning */
+    /* Program page starting from the beginning */
     {OPT_SMALLPAGE, {STATE_CMD_READ0, STATE_CMD_SEQIN | ACTION_ZEROOFF,
STATE_ADDR_PAGE,
                   STATE_DATAIN, STATE_CMD_PAGEPROG | ACTION_PRGPAGE,
STATE_READY}},
-    /* Programm page starting from the second half */
+    /* Program page starting from the second half */
     {OPT_PAGE512, {STATE_CMD_READ1, STATE_CMD_SEQIN | ACTION_HALFOFF,
STATE_ADDR_PAGE,
                   STATE_DATAIN, STATE_CMD_PAGEPROG | ACTION_PRGPAGE,
STATE_READY}},
-    /* Programm OOB */
+    /* Program OOB */
     {OPT_SMALLPAGE, {STATE_CMD_READOOB, STATE_CMD_SEQIN | ACTION_OOBOFF,
STATE_ADDR_PAGE,
                   STATE_DATAIN, STATE_CMD_PAGEPROG | ACTION_PRGPAGE,
STATE_READY}},
     /* Erase sector */
@@ -1171,9 +1171,9 @@ static inline void switch_to_ready_state(struct
nandsim *ns, u_char status)
  * of supported operations.
  *
  * Operation can be unknown because of the following.
- *   1. New command was accepted and this is the firs call to find the
+ *   1. New command was accepted and this is the first call to find the
  *      correspondent states chain. In this case ns->npstates = 0;
- *   2. There is several operations which begin with the same command(s)
+ *   2. There are several operations which begin with the same command(s)
  *      (for example program from the second half and read from the
  *      second half operations both begin with the READ1 command). In this
  *      case the ns->pstates[] array contains previous states.
@@ -1186,7 +1186,7 @@ static inline void switch_to_ready_state(struct
nandsim *ns, u_char status)
  * ns->ops, ns->state, ns->nxstate are initialized, ns->npstate is
  * zeroed).
  *
- * If there are several maches, the current state is pushed to the
+ * If there are several matches, the current state is pushed to the
  * ns->pstates.
  *
  * The operation can be unknown only while commands are input to the chip.
@@ -1195,10 +1195,10 @@ static inline void switch_to_ready_state(struct
nandsim *ns, u_char status)
  * operation is searched using the following pattern:
  *     ns->pstates[0], ... ns->pstates[ns->npstates], <address input>
  *
- * It is supposed that this pattern must either match one operation on
+ * It is supposed that this pattern must either match one operation or
  * none. There can't be ambiguity in that case.
  *
- * If no matches found, the functions does the following:
+ * If no matches found, the function does the following:
  *   1. if there are saved states present, try to ignore them and search
  *      again only using the last command. If nothing was found, switch
  *      to the STATE_READY state.
@@ -1668,7 +1668,7 @@ static int do_state_action(struct nandsim *ns,
uint32_t action)

     case ACTION_PRGPAGE:
         /*
-         * Programm page - move internal buffer data to the page.
+         * Program page - move internal buffer data to the page.
          */

         if (ns->lines.wp) {
@@ -1933,7 +1933,7 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)
         NS_DBG("read_byte: all bytes were read\n");

         /*
-         * The OPT_AUTOINCR allows to read next conseqitive pages without
+         * The OPT_AUTOINCR allows to read next consecutive pages without
          * new read operation cycle.
          */
         if ((ns->options & OPT_AUTOINCR) && NS_STATE(ns->state) ==
STATE_DATAOUT) {

--001485f1e72ad9d31e04940fb2fc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

attached patch fixes the program-&gt;programm and other=A0 spellfixes in co=
mments in nandsim.c<br><br>Signed-off-by:
 srimugunthan=A0 &lt;<a href=3D"mailto:srimugunthan.dhandapani@gmail.com" t=
arget=3D"_blank">srimugunthan.dhandapani@gmail.com</a>&gt;<br><br>-----<br>=
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c<br>ind=
ex a6a73aa..c45e06f 100644<br>
--- a/drivers/mtd/nand/nandsim.c<br>+++ b/drivers/mtd/nand/nandsim.c<br>@@ =
-210,12 +210,12 @@ MODULE_PARM_DESC(bbt,=A0=A0=A0 =A0=A0=A0 =A0&quot;0 OOB,=
 1 BBT with marker in OOB, 2 BBT with marker in d<br>=A0#define STATE_CMD_R=
EAD0=A0=A0=A0=A0=A0=A0=A0 0x00000001 /* read data from the beginning of pag=
e */<br>
=A0#define STATE_CMD_READ1=A0=A0=A0=A0=A0=A0=A0 0x00000002 /* read data fro=
m the second half of page */<br>=A0#define STATE_CMD_READSTART=A0=A0=A0 0x0=
0000003 /* read data second command (large page devices) */<br>-#define STA=
TE_CMD_PAGEPROG=A0=A0=A0=A0 0x00000004 /* start page programm */<br>
+#define STATE_CMD_PAGEPROG=A0=A0=A0=A0 0x00000004 /* start page program */=
<br>=A0#define STATE_CMD_READOOB=A0=A0=A0=A0=A0 0x00000005 /* read OOB area=
 */<br>=A0#define STATE_CMD_ERASE1=A0=A0=A0=A0=A0=A0 0x00000006 /* sector e=
rase first command */<br>=A0#define STATE_CMD_STATUS=A0=A0=A0=A0=A0=A0 0x00=
000007 /* read status */<br>
=A0#define STATE_CMD_STATUS_M=A0=A0=A0=A0 0x00000008 /* read multi-plane st=
atus (isn&#39;t implemented) */<br>-#define STATE_CMD_SEQIN=A0=A0=A0=A0=A0=
=A0=A0 0x00000009 /* sequential data imput */<br>+#define STATE_CMD_SEQIN=
=A0=A0=A0=A0=A0=A0=A0 0x00000009 /* sequential data input */<br>
=A0#define STATE_CMD_READID=A0=A0=A0=A0=A0=A0 0x0000000A /* read ID */<br>=
=A0#define STATE_CMD_ERASE2=A0=A0=A0=A0=A0=A0 0x0000000B /* sector erase se=
cond command */<br>=A0#define STATE_CMD_RESET=A0=A0=A0=A0=A0=A0=A0 0x000000=
0C /* reset */<br>@@ -230,7 +230,7 @@ MODULE_PARM_DESC(bbt,=A0=A0=A0 =A0=A0=
=A0 =A0&quot;0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in d<br>
=A0#define STATE_ADDR_ZERO=A0=A0=A0=A0=A0=A0=A0 0x00000040 /* one byte zero=
 address was accepted */<br>=A0#define STATE_ADDR_MASK=A0=A0=A0=A0=A0=A0=A0=
 0x00000070 /* address states mask */<br>=A0<br>-/* Durind data input/outpu=
t the simulator is in these states */<br>
+/* During data input/output the simulator is in these states */<br>=A0#def=
ine STATE_DATAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x00000100 /* waiting for da=
ta input */<br>=A0#define STATE_DATAIN_MASK=A0=A0=A0=A0=A0 0x00000100 /* da=
ta input states mask */<br>=A0<br>
@@ -248,7 +248,7 @@ MODULE_PARM_DESC(bbt,=A0=A0=A0 =A0=A0=A0 =A0&quot;0 OOB=
, 1 BBT with marker in OOB, 2 BBT with marker in d<br>=A0<br>=A0/* Simulato=
r&#39;s actions bit masks */<br>=A0#define ACTION_CPY=A0=A0=A0=A0=A0=A0 0x0=
0100000 /* copy page/OOB to the internal buffer */<br>
-#define ACTION_PRGPAGE=A0=A0 0x00200000 /* programm the internal buffer to=
 flash */<br>+#define ACTION_PRGPAGE=A0=A0 0x00200000 /* program the intern=
al buffer to flash */<br>=A0#define ACTION_SECERASE=A0 0x00300000 /* erase =
sector */<br>
=A0#define ACTION_ZEROOFF=A0=A0 0x00400000 /* don&#39;t add any offset to a=
ddress */<br>=A0#define ACTION_HALFOFF=A0=A0 0x00500000 /* add to address h=
alf of page */<br>@@ -263,18 +263,18 @@ MODULE_PARM_DESC(bbt,=A0=A0=A0 =A0=
=A0=A0 =A0&quot;0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in d<br>
=A0#define OPT_PAGE512=A0=A0=A0=A0=A0 0x00000002 /* 512-byte=A0 page chips =
*/<br>=A0#define OPT_PAGE2048=A0=A0=A0=A0 0x00000008 /* 2048-byte page chip=
s */<br>=A0#define OPT_SMARTMEDIA=A0=A0 0x00000010 /* SmartMedia technology=
 chips */<br>-#define OPT_AUTOINCR=A0=A0=A0=A0 0x00000020 /* page number au=
to inctimentation is possible */<br>
+#define OPT_AUTOINCR=A0=A0=A0=A0 0x00000020 /* page number auto incrementa=
tion is possible */<br>=A0#define OPT_PAGE512_8BIT 0x00000040 /* 512-byte p=
age chips with 8-bit bus width */<br>=A0#define OPT_PAGE4096=A0=A0=A0=A0 0x=
00000080 /* 4096-byte page chips */<br>
=A0#define OPT_LARGEPAGE=A0=A0=A0 (OPT_PAGE2048 | OPT_PAGE4096) /* 2048 &am=
p; 4096-byte page chips */<br>=A0#define OPT_SMALLPAGE=A0=A0=A0 (OPT_PAGE25=
6=A0 | OPT_PAGE512)=A0 /* 256 and 512-byte page chips */<br>=A0<br>-/* Remo=
ve action bits ftom state */<br>
+/* Remove action bits from state */<br>=A0#define NS_STATE(x) ((x) &amp; ~=
ACTION_MASK)<br>=A0<br>=A0/*<br>=A0 * Maximum previous states which need to=
 be saved. Currently saving is<br>- * only needed for page programm operati=
on with preceeded read command<br>
+ * only needed for page program operation with preceded read command<br>=
=A0 * (which is only valid for 512-byte pages).<br>=A0 */<br>=A0#define NS_=
MAX_PREVSTATES 1<br>@@ -380,16 +380,16 @@ static struct nandsim_operations =
{<br>
=A0=A0=A0=A0 /* Read OOB */<br>=A0=A0=A0=A0 {OPT_SMALLPAGE, {STATE_CMD_READ=
OOB | ACTION_OOBOFF, STATE_ADDR_PAGE | ACTION_CPY,<br>=A0=A0=A0=A0 =A0=A0=
=A0 =A0=A0=A0 STATE_DATAOUT, STATE_READY}},<br>-=A0=A0=A0 /* Programm page =
starting from the beginning */<br>+=A0=A0=A0 /* Program page starting from =
the beginning */<br>
=A0=A0=A0=A0 {OPT_ANY, {STATE_CMD_SEQIN, STATE_ADDR_PAGE, STATE_DATAIN,<br>=
=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 STATE_CMD_PAGEPROG | ACTION_PRGPAGE, STATE=
_READY}},<br>-=A0=A0=A0 /* Programm page starting from the beginning */<br>=
+=A0=A0=A0 /* Program page starting from the beginning */<br>
=A0=A0=A0=A0 {OPT_SMALLPAGE, {STATE_CMD_READ0, STATE_CMD_SEQIN | ACTION_ZER=
OOFF, STATE_ADDR_PAGE,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 =
STATE_DATAIN, STATE_CMD_PAGEPROG | ACTION_PRGPAGE, STATE_READY}},<br>-=A0=
=A0=A0 /* Programm page starting from the second half */<br>
+=A0=A0=A0 /* Program page starting from the second half */<br>=A0=A0=A0=A0=
 {OPT_PAGE512, {STATE_CMD_READ1, STATE_CMD_SEQIN | ACTION_HALFOFF, STATE_AD=
DR_PAGE,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 STATE_DATAIN, =
STATE_CMD_PAGEPROG | ACTION_PRGPAGE, STATE_READY}},<br>
-=A0=A0=A0 /* Programm OOB */<br>+=A0=A0=A0 /* Program OOB */<br>=A0=A0=A0=
=A0 {OPT_SMALLPAGE, {STATE_CMD_READOOB, STATE_CMD_SEQIN | ACTION_OOBOFF, ST=
ATE_ADDR_PAGE,<br>=A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 STATE_DA=
TAIN, STATE_CMD_PAGEPROG | ACTION_PRGPAGE, STATE_READY}},<br>
=A0=A0=A0=A0 /* Erase sector */<br>@@ -1171,9 +1171,9 @@ static inline void=
 switch_to_ready_state(struct nandsim *ns, u_char status)<br>=A0 * of suppo=
rted operations.<br>=A0 *<br>=A0 * Operation can be unknown because of the =
following.<br>
- *=A0=A0 1. New command was accepted and this is the firs call to find the=
<br>+ *=A0=A0 1. New command was accepted and this is the first call to fin=
d the<br>=A0 *=A0=A0=A0=A0=A0 correspondent states chain. In this case ns-&=
gt;npstates =3D 0;<br>
- *=A0=A0 2. There is several operations which begin with the same command(=
s)<br>+ *=A0=A0 2. There are several operations which begin with the same c=
ommand(s)<br>=A0 *=A0=A0=A0=A0=A0 (for example program from the second half=
 and read from the<br>
=A0 *=A0=A0=A0=A0=A0 second half operations both begin with the READ1 comma=
nd). In this<br>=A0 *=A0=A0=A0=A0=A0 case the ns-&gt;pstates[] array contai=
ns previous states.<br>@@ -1186,7 +1186,7 @@ static inline void switch_to_r=
eady_state(struct nandsim *ns, u_char status)<br>
=A0 * ns-&gt;ops, ns-&gt;state, ns-&gt;nxstate are initialized, ns-&gt;npst=
ate is<br>=A0 * zeroed).<br>=A0 *<br>- * If there are several maches, the c=
urrent state is pushed to the<br>+ * If there are several matches, the curr=
ent state is pushed to the<br>
=A0 * ns-&gt;pstates.<br>=A0 *<br>=A0 * The operation can be unknown only w=
hile commands are input to the chip.<br>@@ -1195,10 +1195,10 @@ static inli=
ne void switch_to_ready_state(struct nandsim *ns, u_char status)<br>=A0 * o=
peration is searched using the following pattern:<br>
=A0 *=A0=A0=A0=A0 ns-&gt;pstates[0], ... ns-&gt;pstates[ns-&gt;npstates], &=
lt;address input&gt;<br>=A0 *<br>- * It is supposed that this pattern must =
either match one operation on<br>+ * It is supposed that this pattern must =
either match one operation or<br>
=A0 * none. There can&#39;t be ambiguity in that case.<br>=A0 *<br>- * If n=
o matches found, the functions does the following:<br>+ * If no matches fou=
nd, the function does the following:<br>=A0 *=A0=A0 1. if there are saved s=
tates present, try to ignore them and search<br>
=A0 *=A0=A0=A0=A0=A0 again only using the last command. If nothing was foun=
d, switch<br>=A0 *=A0=A0=A0=A0=A0 to the STATE_READY state.<br>@@ -1668,7 +=
1668,7 @@ static int do_state_action(struct nandsim *ns, uint32_t action)<b=
r>=A0<br>=A0=A0=A0=A0 case ACTION_PRGPAGE:<br>
=A0=A0=A0=A0 =A0=A0=A0 /*<br>-=A0=A0=A0 =A0=A0=A0 =A0* Programm page - move=
 internal buffer data to the page.<br>+=A0=A0=A0 =A0=A0=A0 =A0* Program pag=
e - move internal buffer data to the page.<br>=A0=A0=A0=A0 =A0=A0=A0 =A0*/<=
br>=A0<br>=A0=A0=A0=A0 =A0=A0=A0 if (ns-&gt;lines.wp) {<br>@@ -1933,7 +1933=
,7 @@ static u_char ns_nand_read_byte(struct mtd_info *mtd)<br>
=A0=A0=A0=A0 =A0=A0=A0 NS_DBG(&quot;read_byte: all bytes were read\n&quot;)=
;<br>=A0<br>=A0=A0=A0=A0 =A0=A0=A0 /*<br>-=A0=A0=A0 =A0=A0=A0 =A0* The OPT_=
AUTOINCR allows to read next conseqitive pages without<br>+=A0=A0=A0 =A0=A0=
=A0 =A0* The OPT_AUTOINCR allows to read next consecutive pages without<br>
=A0=A0=A0=A0 =A0=A0=A0 =A0* new read operation cycle.<br>=A0=A0=A0=A0 =A0=
=A0=A0 =A0*/<br>=A0=A0=A0=A0 =A0=A0=A0 if ((ns-&gt;options &amp; OPT_AUTOIN=
CR) &amp;&amp; NS_STATE(ns-&gt;state) =3D=3D STATE_DATAOUT) {<br>

--001485f1e72ad9d31e04940fb2fc--

--001485f1e72ad9d32404940fb2fe
Content-Type: application/octet-stream; name=spell_fixpatch2
Content-Disposition: attachment; filename=spell_fixpatch2
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gg0nqjm00

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvbmFuZHNpbS5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9uYW5kc2ltLmMKaW5kZXggYTZhNzNhYS4uYzQ1ZTA2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9uYW5kc2ltLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9uYW5kc2ltLmMKQEAgLTIx
MCwxMiArMjEwLDEyIEBAIE1PRFVMRV9QQVJNX0RFU0MoYmJ0LAkJICIwIE9PQiwgMSBCQlQgd2l0
aCBtYXJrZXIgaW4gT09CLCAyIEJCVCB3aXRoIG1hcmtlciBpbiBkCiAjZGVmaW5lIFNUQVRFX0NN
RF9SRUFEMCAgICAgICAgMHgwMDAwMDAwMSAvKiByZWFkIGRhdGEgZnJvbSB0aGUgYmVnaW5uaW5n
IG9mIHBhZ2UgKi8KICNkZWZpbmUgU1RBVEVfQ01EX1JFQUQxICAgICAgICAweDAwMDAwMDAyIC8q
IHJlYWQgZGF0YSBmcm9tIHRoZSBzZWNvbmQgaGFsZiBvZiBwYWdlICovCiAjZGVmaW5lIFNUQVRF
X0NNRF9SRUFEU1RBUlQgICAgMHgwMDAwMDAwMyAvKiByZWFkIGRhdGEgc2Vjb25kIGNvbW1hbmQg
KGxhcmdlIHBhZ2UgZGV2aWNlcykgKi8KLSNkZWZpbmUgU1RBVEVfQ01EX1BBR0VQUk9HICAgICAw
eDAwMDAwMDA0IC8qIHN0YXJ0IHBhZ2UgcHJvZ3JhbW0gKi8KKyNkZWZpbmUgU1RBVEVfQ01EX1BB
R0VQUk9HICAgICAweDAwMDAwMDA0IC8qIHN0YXJ0IHBhZ2UgcHJvZ3JhbSAqLwogI2RlZmluZSBT
VEFURV9DTURfUkVBRE9PQiAgICAgIDB4MDAwMDAwMDUgLyogcmVhZCBPT0IgYXJlYSAqLwogI2Rl
ZmluZSBTVEFURV9DTURfRVJBU0UxICAgICAgIDB4MDAwMDAwMDYgLyogc2VjdG9yIGVyYXNlIGZp
cnN0IGNvbW1hbmQgKi8KICNkZWZpbmUgU1RBVEVfQ01EX1NUQVRVUyAgICAgICAweDAwMDAwMDA3
IC8qIHJlYWQgc3RhdHVzICovCiAjZGVmaW5lIFNUQVRFX0NNRF9TVEFUVVNfTSAgICAgMHgwMDAw
MDAwOCAvKiByZWFkIG11bHRpLXBsYW5lIHN0YXR1cyAoaXNuJ3QgaW1wbGVtZW50ZWQpICovCi0j
ZGVmaW5lIFNUQVRFX0NNRF9TRVFJTiAgICAgICAgMHgwMDAwMDAwOSAvKiBzZXF1ZW50aWFsIGRh
dGEgaW1wdXQgKi8KKyNkZWZpbmUgU1RBVEVfQ01EX1NFUUlOICAgICAgICAweDAwMDAwMDA5IC8q
IHNlcXVlbnRpYWwgZGF0YSBpbnB1dCAqLwogI2RlZmluZSBTVEFURV9DTURfUkVBRElEICAgICAg
IDB4MDAwMDAwMEEgLyogcmVhZCBJRCAqLwogI2RlZmluZSBTVEFURV9DTURfRVJBU0UyICAgICAg
IDB4MDAwMDAwMEIgLyogc2VjdG9yIGVyYXNlIHNlY29uZCBjb21tYW5kICovCiAjZGVmaW5lIFNU
QVRFX0NNRF9SRVNFVCAgICAgICAgMHgwMDAwMDAwQyAvKiByZXNldCAqLwpAQCAtMjMwLDcgKzIz
MCw3IEBAIE1PRFVMRV9QQVJNX0RFU0MoYmJ0LAkJICIwIE9PQiwgMSBCQlQgd2l0aCBtYXJrZXIg
aW4gT09CLCAyIEJCVCB3aXRoIG1hcmtlciBpbiBkCiAjZGVmaW5lIFNUQVRFX0FERFJfWkVSTyAg
ICAgICAgMHgwMDAwMDA0MCAvKiBvbmUgYnl0ZSB6ZXJvIGFkZHJlc3Mgd2FzIGFjY2VwdGVkICov
CiAjZGVmaW5lIFNUQVRFX0FERFJfTUFTSyAgICAgICAgMHgwMDAwMDA3MCAvKiBhZGRyZXNzIHN0
YXRlcyBtYXNrICovCiAKLS8qIER1cmluZCBkYXRhIGlucHV0L291dHB1dCB0aGUgc2ltdWxhdG9y
IGlzIGluIHRoZXNlIHN0YXRlcyAqLworLyogRHVyaW5nIGRhdGEgaW5wdXQvb3V0cHV0IHRoZSBz
aW11bGF0b3IgaXMgaW4gdGhlc2Ugc3RhdGVzICovCiAjZGVmaW5lIFNUQVRFX0RBVEFJTiAgICAg
ICAgICAgMHgwMDAwMDEwMCAvKiB3YWl0aW5nIGZvciBkYXRhIGlucHV0ICovCiAjZGVmaW5lIFNU
QVRFX0RBVEFJTl9NQVNLICAgICAgMHgwMDAwMDEwMCAvKiBkYXRhIGlucHV0IHN0YXRlcyBtYXNr
ICovCiAKQEAgLTI0OCw3ICsyNDgsNyBAQCBNT0RVTEVfUEFSTV9ERVNDKGJidCwJCSAiMCBPT0Is
IDEgQkJUIHdpdGggbWFya2VyIGluIE9PQiwgMiBCQlQgd2l0aCBtYXJrZXIgaW4gZAogCiAvKiBT
aW11bGF0b3IncyBhY3Rpb25zIGJpdCBtYXNrcyAqLwogI2RlZmluZSBBQ1RJT05fQ1BZICAgICAg
IDB4MDAxMDAwMDAgLyogY29weSBwYWdlL09PQiB0byB0aGUgaW50ZXJuYWwgYnVmZmVyICovCi0j
ZGVmaW5lIEFDVElPTl9QUkdQQUdFICAgMHgwMDIwMDAwMCAvKiBwcm9ncmFtbSB0aGUgaW50ZXJu
YWwgYnVmZmVyIHRvIGZsYXNoICovCisjZGVmaW5lIEFDVElPTl9QUkdQQUdFICAgMHgwMDIwMDAw
MCAvKiBwcm9ncmFtIHRoZSBpbnRlcm5hbCBidWZmZXIgdG8gZmxhc2ggKi8KICNkZWZpbmUgQUNU
SU9OX1NFQ0VSQVNFICAweDAwMzAwMDAwIC8qIGVyYXNlIHNlY3RvciAqLwogI2RlZmluZSBBQ1RJ
T05fWkVST09GRiAgIDB4MDA0MDAwMDAgLyogZG9uJ3QgYWRkIGFueSBvZmZzZXQgdG8gYWRkcmVz
cyAqLwogI2RlZmluZSBBQ1RJT05fSEFMRk9GRiAgIDB4MDA1MDAwMDAgLyogYWRkIHRvIGFkZHJl
c3MgaGFsZiBvZiBwYWdlICovCkBAIC0yNjMsMTggKzI2MywxOCBAQCBNT0RVTEVfUEFSTV9ERVND
KGJidCwJCSAiMCBPT0IsIDEgQkJUIHdpdGggbWFya2VyIGluIE9PQiwgMiBCQlQgd2l0aCBtYXJr
ZXIgaW4gZAogI2RlZmluZSBPUFRfUEFHRTUxMiAgICAgIDB4MDAwMDAwMDIgLyogNTEyLWJ5dGUg
IHBhZ2UgY2hpcHMgKi8KICNkZWZpbmUgT1BUX1BBR0UyMDQ4ICAgICAweDAwMDAwMDA4IC8qIDIw
NDgtYnl0ZSBwYWdlIGNoaXBzICovCiAjZGVmaW5lIE9QVF9TTUFSVE1FRElBICAgMHgwMDAwMDAx
MCAvKiBTbWFydE1lZGlhIHRlY2hub2xvZ3kgY2hpcHMgKi8KLSNkZWZpbmUgT1BUX0FVVE9JTkNS
ICAgICAweDAwMDAwMDIwIC8qIHBhZ2UgbnVtYmVyIGF1dG8gaW5jdGltZW50YXRpb24gaXMgcG9z
c2libGUgKi8KKyNkZWZpbmUgT1BUX0FVVE9JTkNSICAgICAweDAwMDAwMDIwIC8qIHBhZ2UgbnVt
YmVyIGF1dG8gaW5jcmVtZW50YXRpb24gaXMgcG9zc2libGUgKi8KICNkZWZpbmUgT1BUX1BBR0U1
MTJfOEJJVCAweDAwMDAwMDQwIC8qIDUxMi1ieXRlIHBhZ2UgY2hpcHMgd2l0aCA4LWJpdCBidXMg
d2lkdGggKi8KICNkZWZpbmUgT1BUX1BBR0U0MDk2ICAgICAweDAwMDAwMDgwIC8qIDQwOTYtYnl0
ZSBwYWdlIGNoaXBzICovCiAjZGVmaW5lIE9QVF9MQVJHRVBBR0UgICAgKE9QVF9QQUdFMjA0OCB8
IE9QVF9QQUdFNDA5NikgLyogMjA0OCAmIDQwOTYtYnl0ZSBwYWdlIGNoaXBzICovCiAjZGVmaW5l
IE9QVF9TTUFMTFBBR0UgICAgKE9QVF9QQUdFMjU2ICB8IE9QVF9QQUdFNTEyKSAgLyogMjU2IGFu
ZCA1MTItYnl0ZSBwYWdlIGNoaXBzICovCiAKLS8qIFJlbW92ZSBhY3Rpb24gYml0cyBmdG9tIHN0
YXRlICovCisvKiBSZW1vdmUgYWN0aW9uIGJpdHMgZnJvbSBzdGF0ZSAqLwogI2RlZmluZSBOU19T
VEFURSh4KSAoKHgpICYgfkFDVElPTl9NQVNLKQogCiAvKgogICogTWF4aW11bSBwcmV2aW91cyBz
dGF0ZXMgd2hpY2ggbmVlZCB0byBiZSBzYXZlZC4gQ3VycmVudGx5IHNhdmluZyBpcwotICogb25s
eSBuZWVkZWQgZm9yIHBhZ2UgcHJvZ3JhbW0gb3BlcmF0aW9uIHdpdGggcHJlY2VlZGVkIHJlYWQg
Y29tbWFuZAorICogb25seSBuZWVkZWQgZm9yIHBhZ2UgcHJvZ3JhbSBvcGVyYXRpb24gd2l0aCBw
cmVjZWRlZCByZWFkIGNvbW1hbmQKICAqICh3aGljaCBpcyBvbmx5IHZhbGlkIGZvciA1MTItYnl0
ZSBwYWdlcykuCiAgKi8KICNkZWZpbmUgTlNfTUFYX1BSRVZTVEFURVMgMQpAQCAtMzgwLDE2ICsz
ODAsMTYgQEAgc3RhdGljIHN0cnVjdCBuYW5kc2ltX29wZXJhdGlvbnMgewogCS8qIFJlYWQgT09C
ICovCiAJe09QVF9TTUFMTFBBR0UsIHtTVEFURV9DTURfUkVBRE9PQiB8IEFDVElPTl9PT0JPRkYs
IFNUQVRFX0FERFJfUEFHRSB8IEFDVElPTl9DUFksCiAJCQlTVEFURV9EQVRBT1VULCBTVEFURV9S
RUFEWX19LAotCS8qIFByb2dyYW1tIHBhZ2Ugc3RhcnRpbmcgZnJvbSB0aGUgYmVnaW5uaW5nICov
CisJLyogUHJvZ3JhbSBwYWdlIHN0YXJ0aW5nIGZyb20gdGhlIGJlZ2lubmluZyAqLwogCXtPUFRf
QU5ZLCB7U1RBVEVfQ01EX1NFUUlOLCBTVEFURV9BRERSX1BBR0UsIFNUQVRFX0RBVEFJTiwKIAkJ
CVNUQVRFX0NNRF9QQUdFUFJPRyB8IEFDVElPTl9QUkdQQUdFLCBTVEFURV9SRUFEWX19LAotCS8q
IFByb2dyYW1tIHBhZ2Ugc3RhcnRpbmcgZnJvbSB0aGUgYmVnaW5uaW5nICovCisJLyogUHJvZ3Jh
bSBwYWdlIHN0YXJ0aW5nIGZyb20gdGhlIGJlZ2lubmluZyAqLwogCXtPUFRfU01BTExQQUdFLCB7
U1RBVEVfQ01EX1JFQUQwLCBTVEFURV9DTURfU0VRSU4gfCBBQ1RJT05fWkVST09GRiwgU1RBVEVf
QUREUl9QQUdFLAogCQkJICAgICAgU1RBVEVfREFUQUlOLCBTVEFURV9DTURfUEFHRVBST0cgfCBB
Q1RJT05fUFJHUEFHRSwgU1RBVEVfUkVBRFl9fSwKLQkvKiBQcm9ncmFtbSBwYWdlIHN0YXJ0aW5n
IGZyb20gdGhlIHNlY29uZCBoYWxmICovCisJLyogUHJvZ3JhbSBwYWdlIHN0YXJ0aW5nIGZyb20g
dGhlIHNlY29uZCBoYWxmICovCiAJe09QVF9QQUdFNTEyLCB7U1RBVEVfQ01EX1JFQUQxLCBTVEFU
RV9DTURfU0VRSU4gfCBBQ1RJT05fSEFMRk9GRiwgU1RBVEVfQUREUl9QQUdFLAogCQkJICAgICAg
U1RBVEVfREFUQUlOLCBTVEFURV9DTURfUEFHRVBST0cgfCBBQ1RJT05fUFJHUEFHRSwgU1RBVEVf
UkVBRFl9fSwKLQkvKiBQcm9ncmFtbSBPT0IgKi8KKwkvKiBQcm9ncmFtIE9PQiAqLwogCXtPUFRf
U01BTExQQUdFLCB7U1RBVEVfQ01EX1JFQURPT0IsIFNUQVRFX0NNRF9TRVFJTiB8IEFDVElPTl9P
T0JPRkYsIFNUQVRFX0FERFJfUEFHRSwKIAkJCSAgICAgIFNUQVRFX0RBVEFJTiwgU1RBVEVfQ01E
X1BBR0VQUk9HIHwgQUNUSU9OX1BSR1BBR0UsIFNUQVRFX1JFQURZfX0sCiAJLyogRXJhc2Ugc2Vj
dG9yICovCkBAIC0xMTcxLDkgKzExNzEsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3dpdGNoX3Rv
X3JlYWR5X3N0YXRlKHN0cnVjdCBuYW5kc2ltICpucywgdV9jaGFyIHN0YXR1cykKICAqIG9mIHN1
cHBvcnRlZCBvcGVyYXRpb25zLgogICoKICAqIE9wZXJhdGlvbiBjYW4gYmUgdW5rbm93biBiZWNh
dXNlIG9mIHRoZSBmb2xsb3dpbmcuCi0gKiAgIDEuIE5ldyBjb21tYW5kIHdhcyBhY2NlcHRlZCBh
bmQgdGhpcyBpcyB0aGUgZmlycyBjYWxsIHRvIGZpbmQgdGhlCisgKiAgIDEuIE5ldyBjb21tYW5k
IHdhcyBhY2NlcHRlZCBhbmQgdGhpcyBpcyB0aGUgZmlyc3QgY2FsbCB0byBmaW5kIHRoZQogICog
ICAgICBjb3JyZXNwb25kZW50IHN0YXRlcyBjaGFpbi4gSW4gdGhpcyBjYXNlIG5zLT5ucHN0YXRl
cyA9IDA7Ci0gKiAgIDIuIFRoZXJlIGlzIHNldmVyYWwgb3BlcmF0aW9ucyB3aGljaCBiZWdpbiB3
aXRoIHRoZSBzYW1lIGNvbW1hbmQocykKKyAqICAgMi4gVGhlcmUgYXJlIHNldmVyYWwgb3BlcmF0
aW9ucyB3aGljaCBiZWdpbiB3aXRoIHRoZSBzYW1lIGNvbW1hbmQocykKICAqICAgICAgKGZvciBl
eGFtcGxlIHByb2dyYW0gZnJvbSB0aGUgc2Vjb25kIGhhbGYgYW5kIHJlYWQgZnJvbSB0aGUKICAq
ICAgICAgc2Vjb25kIGhhbGYgb3BlcmF0aW9ucyBib3RoIGJlZ2luIHdpdGggdGhlIFJFQUQxIGNv
bW1hbmQpLiBJbiB0aGlzCiAgKiAgICAgIGNhc2UgdGhlIG5zLT5wc3RhdGVzW10gYXJyYXkgY29u
dGFpbnMgcHJldmlvdXMgc3RhdGVzLgpAQCAtMTE4Niw3ICsxMTg2LDcgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIHN3aXRjaF90b19yZWFkeV9zdGF0ZShzdHJ1Y3QgbmFuZHNpbSAqbnMsIHVfY2hhciBz
dGF0dXMpCiAgKiBucy0+b3BzLCBucy0+c3RhdGUsIG5zLT5ueHN0YXRlIGFyZSBpbml0aWFsaXpl
ZCwgbnMtPm5wc3RhdGUgaXMKICAqIHplcm9lZCkuCiAgKgotICogSWYgdGhlcmUgYXJlIHNldmVy
YWwgbWFjaGVzLCB0aGUgY3VycmVudCBzdGF0ZSBpcyBwdXNoZWQgdG8gdGhlCisgKiBJZiB0aGVy
ZSBhcmUgc2V2ZXJhbCBtYXRjaGVzLCB0aGUgY3VycmVudCBzdGF0ZSBpcyBwdXNoZWQgdG8gdGhl
CiAgKiBucy0+cHN0YXRlcy4KICAqCiAgKiBUaGUgb3BlcmF0aW9uIGNhbiBiZSB1bmtub3duIG9u
bHkgd2hpbGUgY29tbWFuZHMgYXJlIGlucHV0IHRvIHRoZSBjaGlwLgpAQCAtMTE5NSwxMCArMTE5
NSwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3dpdGNoX3RvX3JlYWR5X3N0YXRlKHN0cnVjdCBu
YW5kc2ltICpucywgdV9jaGFyIHN0YXR1cykKICAqIG9wZXJhdGlvbiBpcyBzZWFyY2hlZCB1c2lu
ZyB0aGUgZm9sbG93aW5nIHBhdHRlcm46CiAgKiAgICAgbnMtPnBzdGF0ZXNbMF0sIC4uLiBucy0+
cHN0YXRlc1tucy0+bnBzdGF0ZXNdLCA8YWRkcmVzcyBpbnB1dD4KICAqCi0gKiBJdCBpcyBzdXBw
b3NlZCB0aGF0IHRoaXMgcGF0dGVybiBtdXN0IGVpdGhlciBtYXRjaCBvbmUgb3BlcmF0aW9uIG9u
CisgKiBJdCBpcyBzdXBwb3NlZCB0aGF0IHRoaXMgcGF0dGVybiBtdXN0IGVpdGhlciBtYXRjaCBv
bmUgb3BlcmF0aW9uIG9yCiAgKiBub25lLiBUaGVyZSBjYW4ndCBiZSBhbWJpZ3VpdHkgaW4gdGhh
dCBjYXNlLgogICoKLSAqIElmIG5vIG1hdGNoZXMgZm91bmQsIHRoZSBmdW5jdGlvbnMgZG9lcyB0
aGUgZm9sbG93aW5nOgorICogSWYgbm8gbWF0Y2hlcyBmb3VuZCwgdGhlIGZ1bmN0aW9uIGRvZXMg
dGhlIGZvbGxvd2luZzoKICAqICAgMS4gaWYgdGhlcmUgYXJlIHNhdmVkIHN0YXRlcyBwcmVzZW50
LCB0cnkgdG8gaWdub3JlIHRoZW0gYW5kIHNlYXJjaAogICogICAgICBhZ2FpbiBvbmx5IHVzaW5n
IHRoZSBsYXN0IGNvbW1hbmQuIElmIG5vdGhpbmcgd2FzIGZvdW5kLCBzd2l0Y2gKICAqICAgICAg
dG8gdGhlIFNUQVRFX1JFQURZIHN0YXRlLgpAQCAtMTY2OCw3ICsxNjY4LDcgQEAgc3RhdGljIGlu
dCBkb19zdGF0ZV9hY3Rpb24oc3RydWN0IG5hbmRzaW0gKm5zLCB1aW50MzJfdCBhY3Rpb24pCiAK
IAljYXNlIEFDVElPTl9QUkdQQUdFOgogCQkvKgotCQkgKiBQcm9ncmFtbSBwYWdlIC0gbW92ZSBp
bnRlcm5hbCBidWZmZXIgZGF0YSB0byB0aGUgcGFnZS4KKwkJICogUHJvZ3JhbSBwYWdlIC0gbW92
ZSBpbnRlcm5hbCBidWZmZXIgZGF0YSB0byB0aGUgcGFnZS4KIAkJICovCiAKIAkJaWYgKG5zLT5s
aW5lcy53cCkgewpAQCAtMTkzMyw3ICsxOTMzLDcgQEAgc3RhdGljIHVfY2hhciBuc19uYW5kX3Jl
YWRfYnl0ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAkJTlNfREJHKCJyZWFkX2J5dGU6IGFsbCBi
eXRlcyB3ZXJlIHJlYWRcbiIpOwogCiAJCS8qCi0JCSAqIFRoZSBPUFRfQVVUT0lOQ1IgYWxsb3dz
IHRvIHJlYWQgbmV4dCBjb25zZXFpdGl2ZSBwYWdlcyB3aXRob3V0CisJCSAqIFRoZSBPUFRfQVVU
T0lOQ1IgYWxsb3dzIHRvIHJlYWQgbmV4dCBjb25zZWN1dGl2ZSBwYWdlcyB3aXRob3V0CiAJCSAq
IG5ldyByZWFkIG9wZXJhdGlvbiBjeWNsZS4KIAkJICovCiAJCWlmICgobnMtPm9wdGlvbnMgJiBP
UFRfQVVUT0lOQ1IpICYmIE5TX1NUQVRFKG5zLT5zdGF0ZSkgPT0gU1RBVEVfREFUQU9VVCkgewo=
--001485f1e72ad9d32404940fb2fe--
