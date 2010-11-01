Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PCzQs-0003UB-1s
	for linux-mtd@lists.infradead.org; Mon, 01 Nov 2010 18:48:39 +0000
Received: by wwi17 with SMTP id 17so198626wwi.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Nov 2010 11:48:35 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Nov 2010 00:18:34 +0530
Message-ID: <AANLkTimGScstLNC2Hs1v-h6BF0y8GFTw4TJw8JEt+j8X@mail.gmail.com>
Subject: [PATCH] trivial: nandsim.c spell fixes in comments
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: kernel-janitors@vger.kernel.org
Content-Type: multipart/mixed; boundary=0016e65bb51c6057700494024100
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016e65bb51c6057700494024100
Content-Type: multipart/alternative; boundary=0016e65bb51c60575b04940241fe

--0016e65bb51c60575b04940241fe
Content-Type: text/plain; charset=ISO-8859-1

attached patch has trivial spell fixes in comments in nandsim.c
Signed-off-by: srimugunthan  <srimugunthan.dhandapani@gmail.com>

------
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index a6a73aa..697979c 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -230,7 +230,7 @@ MODULE_PARM_DESC(bbt,         "0 OOB, 1 BBT with marker
in OOB, 2 BBT with marker in d
 #define STATE_ADDR_ZERO        0x00000040 /* one byte zero address was
accepted */
 #define STATE_ADDR_MASK        0x00000070 /* address states mask */

-/* Durind data input/output the simulator is in these states */
+/* During data input/output the simulator is in these states */
 #define STATE_DATAIN           0x00000100 /* waiting for data input */
 #define STATE_DATAIN_MASK      0x00000100 /* data input states mask */

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
+ * only needed for page programm operation with preceded read command
  * (which is only valid for 512-byte pages).
  */
 #define NS_MAX_PREVSTATES 1
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
@@ -1195,7 +1195,7 @@ static inline void switch_to_ready_state(struct
nandsim *ns, u_char status)
  * operation is searched using the following pattern:
  *     ns->pstates[0], ... ns->pstates[ns->npstates], <address input>
  *
- * It is supposed that this pattern must either match one operation on
+ * It is supposed that this pattern must either match one operation or
  * none. There can't be ambiguity in that case.
  *
  * If no matches found, the functions does the following:

--0016e65bb51c60575b04940241fe
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

attached patch has trivial spell fixes in comments in nandsim.c<br>Signed-o=
ff-by: srimugunthan=A0 &lt;<a href=3D"mailto:srimugunthan.dhandapani@gmail.=
com" target=3D"_blank">srimugunthan.dhandapani@gmail.com</a>&gt;<br><br>---=
---<br>

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c<br>
index a6a73aa..697979c 100644<br>--- a/drivers/mtd/nand/nandsim.c<br>+++ b/=
drivers/mtd/nand/nandsim.c<br>
@@ -230,7 +230,7 @@ MODULE_PARM_DESC(bbt,=A0=A0=A0 =A0=A0=A0 =A0&quot;0 OOB=
, 1 BBT with marker in OOB, 2 BBT with marker in d<br>=A0#define STATE_ADDR=
_ZERO=A0=A0=A0=A0=A0=A0=A0 0x00000040 /* one byte zero address was accepted=
 */<br>=A0#define STATE_ADDR_MASK=A0=A0=A0=A0=A0=A0=A0 0x00000070 /* addres=
s states mask */<br>



=A0<br>-/* Durind data input/output the simulator is in these states */<br>=
+/* During data input/output the simulator is in these states */<br>=A0#def=
ine STATE_DATAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x00000100 /* waiting for da=
ta input */<br>=A0#define STATE_DATAIN_MASK=A0=A0=A0=A0=A0 0x00000100 /* da=
ta input states mask */<br>



=A0<br>@@ -263,18 +263,18 @@ MODULE_PARM_DESC(bbt,=A0=A0=A0 =A0=A0=A0 =A0&q=
uot;0 OOB, 1 BBT with marker in OOB, 2 BBT with marker in d<br>=A0#define O=
PT_PAGE512=A0=A0=A0=A0=A0 0x00000002 /* 512-byte=A0 page chips */<br>=A0#de=
fine OPT_PAGE2048=A0=A0=A0=A0 0x00000008 /* 2048-byte page chips */<br>



=A0#define OPT_SMARTMEDIA=A0=A0 0x00000010 /* SmartMedia technology chips *=
/<br>-#define OPT_AUTOINCR=A0=A0=A0=A0 0x00000020 /* page number auto incti=
mentation is possible */<br>+#define OPT_AUTOINCR=A0=A0=A0=A0 0x00000020 /*=
 page number auto incrementation is possible */<br>



=A0#define OPT_PAGE512_8BIT 0x00000040 /* 512-byte page chips with 8-bit bu=
s width */<br>=A0#define OPT_PAGE4096=A0=A0=A0=A0 0x00000080 /* 4096-byte p=
age chips */<br>=A0#define OPT_LARGEPAGE=A0=A0=A0 (OPT_PAGE2048 | OPT_PAGE4=
096) /* 2048 &amp; 4096-byte page chips */<br>



=A0#define OPT_SMALLPAGE=A0=A0=A0 (OPT_PAGE256=A0 | OPT_PAGE512)=A0 /* 256 =
and 512-byte page chips */<br>=A0<br>-/* Remove action bits ftom state */<b=
r>+/* Remove action bits from state */<br>=A0#define NS_STATE(x) ((x) &amp;=
 ~ACTION_MASK)<br>



=A0<br>=A0/*<br>=A0 * Maximum previous states which need to be saved. Curre=
ntly saving is<br>- * only needed for page programm operation with preceede=
d read command<br>+ * only needed for page programm operation with preceded=
 read command<br>



=A0 * (which is only valid for 512-byte pages).<br>=A0 */<br>=A0#define NS_=
MAX_PREVSTATES 1<br>@@ -1171,9 +1171,9 @@ static inline void switch_to_read=
y_state(struct nandsim *ns, u_char status)<br>=A0 * of supported operations=
.<br>



=A0 *<br>=A0 * Operation can be unknown because of the following.<br>- *=A0=
=A0 1. New command was accepted and this is the firs call to find the<br>+ =
*=A0=A0 1. New command was accepted and this is the first call to find the<=
br>=A0 *=A0=A0=A0=A0=A0 correspondent states chain. In this case ns-&gt;nps=
tates =3D 0;<br>



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
hile commands are input to the chip.<br>@@ -1195,7 +1195,7 @@ static inline=
 void switch_to_ready_state(struct nandsim *ns, u_char status)<br>=A0 * ope=
ration is searched using the following pattern:<br>



=A0 *=A0=A0=A0=A0 ns-&gt;pstates[0], ... ns-&gt;pstates[ns-&gt;npstates], &=
lt;address input&gt;<br>=A0 *<br>- * It is supposed that this pattern must =
either match one operation on<br>+ * It is supposed that this pattern must =
either match one operation or<br>



=A0 * none. There can&#39;t be ambiguity in that case.<br>=A0 *<br>=A0 * If=
 no matches found, the functions does the following:<br>

--0016e65bb51c60575b04940241fe--

--0016e65bb51c6057700494024100
Content-Type: application/octet-stream; name=spell_fix_patch
Content-Disposition: attachment; filename=spell_fix_patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gfzp9i0f0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvbmFuZHNpbS5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9uYW5kc2ltLmMKaW5kZXggYTZhNzNhYS4uNjk3OTc5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9uYW5kc2ltLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9uYW5kc2ltLmMKQEAgLTIz
MCw3ICsyMzAsNyBAQCBNT0RVTEVfUEFSTV9ERVNDKGJidCwJCSAiMCBPT0IsIDEgQkJUIHdpdGgg
bWFya2VyIGluIE9PQiwgMiBCQlQgd2l0aCBtYXJrZXIgaW4gZAogI2RlZmluZSBTVEFURV9BRERS
X1pFUk8gICAgICAgIDB4MDAwMDAwNDAgLyogb25lIGJ5dGUgemVybyBhZGRyZXNzIHdhcyBhY2Nl
cHRlZCAqLwogI2RlZmluZSBTVEFURV9BRERSX01BU0sgICAgICAgIDB4MDAwMDAwNzAgLyogYWRk
cmVzcyBzdGF0ZXMgbWFzayAqLwogCi0vKiBEdXJpbmQgZGF0YSBpbnB1dC9vdXRwdXQgdGhlIHNp
bXVsYXRvciBpcyBpbiB0aGVzZSBzdGF0ZXMgKi8KKy8qIER1cmluZyBkYXRhIGlucHV0L291dHB1
dCB0aGUgc2ltdWxhdG9yIGlzIGluIHRoZXNlIHN0YXRlcyAqLwogI2RlZmluZSBTVEFURV9EQVRB
SU4gICAgICAgICAgIDB4MDAwMDAxMDAgLyogd2FpdGluZyBmb3IgZGF0YSBpbnB1dCAqLwogI2Rl
ZmluZSBTVEFURV9EQVRBSU5fTUFTSyAgICAgIDB4MDAwMDAxMDAgLyogZGF0YSBpbnB1dCBzdGF0
ZXMgbWFzayAqLwogCkBAIC0yNjMsMTggKzI2MywxOCBAQCBNT0RVTEVfUEFSTV9ERVNDKGJidCwJ
CSAiMCBPT0IsIDEgQkJUIHdpdGggbWFya2VyIGluIE9PQiwgMiBCQlQgd2l0aCBtYXJrZXIgaW4g
ZAogI2RlZmluZSBPUFRfUEFHRTUxMiAgICAgIDB4MDAwMDAwMDIgLyogNTEyLWJ5dGUgIHBhZ2Ug
Y2hpcHMgKi8KICNkZWZpbmUgT1BUX1BBR0UyMDQ4ICAgICAweDAwMDAwMDA4IC8qIDIwNDgtYnl0
ZSBwYWdlIGNoaXBzICovCiAjZGVmaW5lIE9QVF9TTUFSVE1FRElBICAgMHgwMDAwMDAxMCAvKiBT
bWFydE1lZGlhIHRlY2hub2xvZ3kgY2hpcHMgKi8KLSNkZWZpbmUgT1BUX0FVVE9JTkNSICAgICAw
eDAwMDAwMDIwIC8qIHBhZ2UgbnVtYmVyIGF1dG8gaW5jdGltZW50YXRpb24gaXMgcG9zc2libGUg
Ki8KKyNkZWZpbmUgT1BUX0FVVE9JTkNSICAgICAweDAwMDAwMDIwIC8qIHBhZ2UgbnVtYmVyIGF1
dG8gaW5jcmVtZW50YXRpb24gaXMgcG9zc2libGUgKi8KICNkZWZpbmUgT1BUX1BBR0U1MTJfOEJJ
VCAweDAwMDAwMDQwIC8qIDUxMi1ieXRlIHBhZ2UgY2hpcHMgd2l0aCA4LWJpdCBidXMgd2lkdGgg
Ki8KICNkZWZpbmUgT1BUX1BBR0U0MDk2ICAgICAweDAwMDAwMDgwIC8qIDQwOTYtYnl0ZSBwYWdl
IGNoaXBzICovCiAjZGVmaW5lIE9QVF9MQVJHRVBBR0UgICAgKE9QVF9QQUdFMjA0OCB8IE9QVF9Q
QUdFNDA5NikgLyogMjA0OCAmIDQwOTYtYnl0ZSBwYWdlIGNoaXBzICovCiAjZGVmaW5lIE9QVF9T
TUFMTFBBR0UgICAgKE9QVF9QQUdFMjU2ICB8IE9QVF9QQUdFNTEyKSAgLyogMjU2IGFuZCA1MTIt
Ynl0ZSBwYWdlIGNoaXBzICovCiAKLS8qIFJlbW92ZSBhY3Rpb24gYml0cyBmdG9tIHN0YXRlICov
CisvKiBSZW1vdmUgYWN0aW9uIGJpdHMgZnJvbSBzdGF0ZSAqLwogI2RlZmluZSBOU19TVEFURSh4
KSAoKHgpICYgfkFDVElPTl9NQVNLKQogCiAvKgogICogTWF4aW11bSBwcmV2aW91cyBzdGF0ZXMg
d2hpY2ggbmVlZCB0byBiZSBzYXZlZC4gQ3VycmVudGx5IHNhdmluZyBpcwotICogb25seSBuZWVk
ZWQgZm9yIHBhZ2UgcHJvZ3JhbW0gb3BlcmF0aW9uIHdpdGggcHJlY2VlZGVkIHJlYWQgY29tbWFu
ZAorICogb25seSBuZWVkZWQgZm9yIHBhZ2UgcHJvZ3JhbW0gb3BlcmF0aW9uIHdpdGggcHJlY2Vk
ZWQgcmVhZCBjb21tYW5kCiAgKiAod2hpY2ggaXMgb25seSB2YWxpZCBmb3IgNTEyLWJ5dGUgcGFn
ZXMpLgogICovCiAjZGVmaW5lIE5TX01BWF9QUkVWU1RBVEVTIDEKQEAgLTExNzEsOSArMTE3MSw5
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzd2l0Y2hfdG9fcmVhZHlfc3RhdGUoc3RydWN0IG5hbmRz
aW0gKm5zLCB1X2NoYXIgc3RhdHVzKQogICogb2Ygc3VwcG9ydGVkIG9wZXJhdGlvbnMuCiAgKgog
ICogT3BlcmF0aW9uIGNhbiBiZSB1bmtub3duIGJlY2F1c2Ugb2YgdGhlIGZvbGxvd2luZy4KLSAq
ICAgMS4gTmV3IGNvbW1hbmQgd2FzIGFjY2VwdGVkIGFuZCB0aGlzIGlzIHRoZSBmaXJzIGNhbGwg
dG8gZmluZCB0aGUKKyAqICAgMS4gTmV3IGNvbW1hbmQgd2FzIGFjY2VwdGVkIGFuZCB0aGlzIGlz
IHRoZSBmaXJzdCBjYWxsIHRvIGZpbmQgdGhlCiAgKiAgICAgIGNvcnJlc3BvbmRlbnQgc3RhdGVz
IGNoYWluLiBJbiB0aGlzIGNhc2UgbnMtPm5wc3RhdGVzID0gMDsKLSAqICAgMi4gVGhlcmUgaXMg
c2V2ZXJhbCBvcGVyYXRpb25zIHdoaWNoIGJlZ2luIHdpdGggdGhlIHNhbWUgY29tbWFuZChzKQor
ICogICAyLiBUaGVyZSBhcmUgc2V2ZXJhbCBvcGVyYXRpb25zIHdoaWNoIGJlZ2luIHdpdGggdGhl
IHNhbWUgY29tbWFuZChzKQogICogICAgICAoZm9yIGV4YW1wbGUgcHJvZ3JhbSBmcm9tIHRoZSBz
ZWNvbmQgaGFsZiBhbmQgcmVhZCBmcm9tIHRoZQogICogICAgICBzZWNvbmQgaGFsZiBvcGVyYXRp
b25zIGJvdGggYmVnaW4gd2l0aCB0aGUgUkVBRDEgY29tbWFuZCkuIEluIHRoaXMKICAqICAgICAg
Y2FzZSB0aGUgbnMtPnBzdGF0ZXNbXSBhcnJheSBjb250YWlucyBwcmV2aW91cyBzdGF0ZXMuCkBA
IC0xMTg2LDcgKzExODYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3dpdGNoX3RvX3JlYWR5X3N0
YXRlKHN0cnVjdCBuYW5kc2ltICpucywgdV9jaGFyIHN0YXR1cykKICAqIG5zLT5vcHMsIG5zLT5z
dGF0ZSwgbnMtPm54c3RhdGUgYXJlIGluaXRpYWxpemVkLCBucy0+bnBzdGF0ZSBpcwogICogemVy
b2VkKS4KICAqCi0gKiBJZiB0aGVyZSBhcmUgc2V2ZXJhbCBtYWNoZXMsIHRoZSBjdXJyZW50IHN0
YXRlIGlzIHB1c2hlZCB0byB0aGUKKyAqIElmIHRoZXJlIGFyZSBzZXZlcmFsIG1hdGNoZXMsIHRo
ZSBjdXJyZW50IHN0YXRlIGlzIHB1c2hlZCB0byB0aGUKICAqIG5zLT5wc3RhdGVzLgogICoKICAq
IFRoZSBvcGVyYXRpb24gY2FuIGJlIHVua25vd24gb25seSB3aGlsZSBjb21tYW5kcyBhcmUgaW5w
dXQgdG8gdGhlIGNoaXAuCkBAIC0xMTk1LDcgKzExOTUsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
c3dpdGNoX3RvX3JlYWR5X3N0YXRlKHN0cnVjdCBuYW5kc2ltICpucywgdV9jaGFyIHN0YXR1cykK
ICAqIG9wZXJhdGlvbiBpcyBzZWFyY2hlZCB1c2luZyB0aGUgZm9sbG93aW5nIHBhdHRlcm46CiAg
KiAgICAgbnMtPnBzdGF0ZXNbMF0sIC4uLiBucy0+cHN0YXRlc1tucy0+bnBzdGF0ZXNdLCA8YWRk
cmVzcyBpbnB1dD4KICAqCi0gKiBJdCBpcyBzdXBwb3NlZCB0aGF0IHRoaXMgcGF0dGVybiBtdXN0
IGVpdGhlciBtYXRjaCBvbmUgb3BlcmF0aW9uIG9uCisgKiBJdCBpcyBzdXBwb3NlZCB0aGF0IHRo
aXMgcGF0dGVybiBtdXN0IGVpdGhlciBtYXRjaCBvbmUgb3BlcmF0aW9uIG9yCiAgKiBub25lLiBU
aGVyZSBjYW4ndCBiZSBhbWJpZ3VpdHkgaW4gdGhhdCBjYXNlLgogICoKICAqIElmIG5vIG1hdGNo
ZXMgZm91bmQsIHRoZSBmdW5jdGlvbnMgZG9lcyB0aGUgZm9sbG93aW5nOgo=
--0016e65bb51c6057700494024100--
