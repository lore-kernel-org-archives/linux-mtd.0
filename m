Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17de2B-0005dr-00
	for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2002 22:44:31 +0100
Message-ID: <3D5589EA.3A9B1082@opersys.com>
Date: Sat, 10 Aug 2002 17:47:22 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: Mark Meade <mark@lakeshoremicro.com>
CC: Linux-MTD <linux-mtd@lists.infradead.org>
Subject: Possible fix for Grub hotplug problem [needs testing]
Content-Type: multipart/mixed;
 boundary="------------47F13F19887B87240BFA50D4"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.
--------------47F13F19887B87240BFA50D4
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


I've modified doc_stage1.S to do the following:
o Copy the old interrupt handler (whether it be int 18 or 19) before
  overwriting it.
o The Grub int handler calls on the BIOS's int 16 to check whether
  the user is holding down the "ctrl" key.
o If he is, then the old handler is copied back in place and invoked.
o If he isn't, then the code continues on with loading the DOC.

I had to shorten the "msgjmp" string to get the code to still fit
in 512 bytes. On a tangential note: given the 512 byte limitations
it may be simpler get rid of any printout and output single chars,
like lilo does when booting. The expensive string ops could then be
left once we're out of the 512 bytes.

I haven't tested the code. Because my real-mode programming skills
are somewhat rusty, I wanted someone else to take a look at it first
in case I made a mistake somewhere. (I would usually test stuff
before sending it off, but hotplugging my card isn't very appealing,
hence the additional caution).

I've attached a bzip2'd copy of my modified doc_stage1.S. The code
I added is surrounded by "#ifdef KEYBRD_READ" statements for easier
reading.

Any comments and suggestions are greatly appreciated.

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
--------------47F13F19887B87240BFA50D4
Content-Type: application/octet-stream;
 name="doc_stage1.S.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="doc_stage1.S.bz2"

QlpoOTFBWSZTWVnpyJsACJ9/gHr6hERf///////f5L//3/BgFJ7zO9Yd9UdyJewwL3jRD7aV
157uRoA0daCUwM22mmlVJvbqL092RIr0MqA00RMkwjE1MGmk0T1T9MmplNM1NPSbU9TaTRo0
AGmjJo0GmiaBNAQKZoJPT1NEMjajQA0eoaaAADQeoBFNpohMJGamIxMmjCMEeoYRhBhMBGEY
mJkEhIRAmBNUzEmym1GSPQjankTINMgxDQBoGjIJJQ1NI9TaQMQaeoAeoBoANAA0A000MgAE
iQhpNMiZGFMFT9NDKn6nqnk9U/Uym02pinpNNAAeiGmjRPpyJ5IS8GQkkYbJToGSCBgnWB5A
Ff6+yuzH2EjJEQf1zXiIkgrMRkj8DbbXwaoxHQxsG42wxUxl/XRgyDQxI+7VBZMRGkAwgBR7
mRgAnYU5mgwAnOWQFeGP1mX7Zfvs95wniX36HB+7iAl+PTLBfhKKTUlpsT1KoMcdniy/D21S
soLORstLCQ3I8pRe8ZqBHmMzODdFeRpjBZEiHLMXumWEkah4lsJ0EHM0SraBFRavCShQzNaS
RKtchmyY8iPGcfvDOoXSLgJZs4yjqwom29p1q11Ljrk7Y6PCBw46en2RuhJpFIQht1Yu6SEF
cZ7FP4q20PF2JeaSeVdYonrY+PYJrZ1ep2QEvCiijKvtZd5QLp42DigcRXRKzlXOeMhbxFqY
LtUNCyJihexRqFiQVJPZVa9yqJ6BK8OLS9PK5xOmRqdyiSPoyp1ndhu0hiDaFuKLp4Bq5ahh
QHkUCfZJPsdW+S4lnn0wLXhTH3e3e2JLySRc76uE1+DB2Mj4dyQgDk4jo/HfFNttZzBIA08M
CBAPy7kxg2m0mkxNJtMYzBAfGBWZe/uMVMUo0dvXX2fLs6pkXtjmw4UaBiRRpBnfiYDYASaS
RsO3XlvxSjmbDVwrgxpaxa1W/FcMlTQPj9NAU22D/RLJjpxYKjkfnS0r0O/BrV1CjBMbbYNp
yJRoVmo13vv7vz4N/f83zePt0rXpN54m0hQgIOoBQgUx797bb17mvV9Zp3dtTHDaYyY+xjbF
zVf1p9TQ/2FY532CtZhkXFCdq3eGDjHkazXZK2bJxwuo/jQQT1AesesX45dlGD/rM+TIHyJV
W6aZO2XonktmXAosLc9E9Wxj+a5HroM8LivnSuuNormi/Zdydz8vfhhS3H0W9kRtOIGygkMJ
PXWbrqU1Uoq6LuhOAPM2y/GfBxAG5VSwSLAYE45hBEWEo0O8iZFNBQCXG4tcAvltOCnws432
6mAvkn62qGkNgI/pIPW9szrwXL1SjkeJsKiW0FWQWsnkRyo+mPFn8OsQwrK0dmrhiSyyqzB3
camdCRaAaIOYB4KAOA16MkIdmuUoRSR6iGsr/nldIT2G6EyV4jA+14yR4Rgsp1t90Ky0+AUM
z1xzC9MH4K/UR/guc5oIJSC7AnSDsYgTQcinnjMfLDILj1npz5m3R70PEXm2v4ax8rZjSOKb
N2l+q2LmaqiyaDWVcxyYYpyxp7QUsLDRc0ppKYGrMAzr5Vdbt0h1Kubt8KRrtwSOMKCo1HMq
ibMatHSuWeHVOM+TFE80GOalc1yvBwTjM1WzkZK3UUGeYdCU3Yb5Rm4aZc4nEmAz8PVCG4Yd
2XPrFxtqYXvpbKU6+is4fAN8X30VDybiYZCAeS7WLoouum2ShXeQaS8HfZAb+nt77C+YlwVY
voUa0qLANK9dvpa82HieulkjQZC5uu/pYCRx5GTUd1u5xCfKSdXk1UGWJvgGE1zp2+AUW1+D
loL/3OXPQb4bq954kP0ZxufnMSFzLNVwqRUU01OHjPXIR2O1lnCofLd2qOI3CLTIrF9OKPVj
tLNUCzTpGmOdn0ZwYGZVeBkYwKhRsULurmmAdTGCPDgzsYesIKLXta+12+PAwxaYHGvvs0R5
5Ya9Ou2mrRjssMcn08a+izYg97DoATgOpMGMahw4wJ+1wGk02qZFDe02MkoKUTbaG1VRFVSo
bCqKKiGMkI2nJRSKG2yQJTjHGyiFEgSm4nTgUx/WKU/uyhUsyivlIqDCbIUggE+oLNsBKKD9
nLnXr31KWQ4mfeuPr3+Tuz0ZnwHm2r5xuECNOEFGgGMIRMaGwEONxMaZG3JIhuMchHGRfSNg
DJTh6igF1sV2hsSCzAPT8nk7+j0Y739ewEdEbFff5O94L+r06MXIvWtKemKu07mG2M3H0Ush
GxBM2Pz4I+bsA1C58u1vZqfO8vuhb1UPqBn+bhVl7hNCQi+ijX9Xj2N5phPbEaQbViHTcj2c
S49/n58GhXHiKNSLhvgMSTp7pnCJIMNOPflGv8G3lw06Rd3+V0ngh0fE/H2vYGOvbbh5tWGw
y5I3y5KiWqbDXbbznh1GLzsutlq2/NbJQi0yCJhJFLWXbia9MjP4OMGN/3+WUNdN6VDTsyAy
hDiriFwL7HqXvbQO/n4e52Qa8yaLktpB7lQMeNU2NIz5cbaKc+aOqeFZGxmM5RXw1VRREz9V
aC8TCmrZlL0/KZ4Vyals6bUNse2Rg2MbabRIItsdBIvqIEBYL6USh3kxFAlgrrEJdrRVVRSE
0du/hnc4y2j1XOINsKcOLG1IVzmRY+hw6IWgPxtJh9YwlKICebz9hMWE8dVzJ8UtWP0FLsrr
fnaqdWdEtl3dUpLiNGWgEZbMZNjTEypE1cxGITRC7Cou55byIUQVejzDKLmTr6hkOgGDdXPx
iSqIjlDrma0lLyEXtHmjOL+tGDXgQDX6pDCfytk5It7kb/MOFHtcVDvieSvZhTyqU2r2zasc
nK+I6AmEsNisrLz9b8Lz7eSYfms1tfE4IEZ0SW4TOyfqa9oVIIcgYHzpHvdJpRYWYMIg4SNg
xiXxf8zDIAdw7hjWEEPWPqGot5oGNtsKYRZiZg1awatGMJtlwC3FSqzikc5aJep/gMi9GCls
RmDm5swj4yIVOfPUnlZaLwF1YH3d0VC4UcTQYXiZOSWhsaD5L9NUeOoixR3BAYwQ1p+52iwo
s8H0Dkltj0CUt9RvIA0sEoIqUjcihQSaCWMNLGG4m3ssy1KhyiJsL8zSuyImTLCUAdS97cg4
PCkkc6ec5UYLlxSz3EKZ2g7Egu4CjGl4QQjeGsQcwnrRgedFvOXCNzRNL1ow5gmQwLo1+mAk
ZtMpU8QtYpp/G8jiEqlbDkqSDYlwj/hY6wcjFU3NbHV/BrbzGMrDHeK8O0vCgCprLUWH3sWQ
NLjWa3YS0G6TyEnO0BhNKfHPMwLwzkhfZMCzEEV2mcVA8DwO45enrPYGAeU54R0I8YfpmjE1
mkSsFamSWwsDcjpF5AuRvpdeXoGXgSRMMliLSM0HtDSSm038Pj7pCdtP5/OxuaoUXGoRDjHz
FDrXhYyrMzeqVKMLZjJTrgWslBWkd4T93VfU/peM9gWtiO3uHREWUDzL00Gzsdx7cdLFoQ1D
Gz3e0Ans1HrPIydEBezi0r7oJzMTagVL4kWrxwSCcDa6mEMddmzmA313iazcb8VTUI6EkE6e
TlgwQdpxPQg+HyjJEGLZcBlUaGDbO/o8xy1L8KG2UrkGV0ca0DEDbZYvPxNftcnE1p/JDxlQ
23bZJuqUI2tGMZ5eGXp3vqg9zRtX0dNEHLq8x9jJ+EpEj6sVBZ2d54J4hdYN/aOG08OOA0Dr
eghHIp7rl9KCgZA0xlk7LMkUQc81dBekGYUECOtLrSYM4bjMVjamRWus2z1tSHRg+CUt4XBb
MhXOMbmxiZiUwSgMU2rQMmNixaDIaLViVxgUYE8peomi0pXDCD2OFaDmNkp2z5WljOVRTMnL
NYoibjlrRVHaU3JSKbpxVCEtQGUxVVwnx4uxq0zQXjHMXgxXYtIizVqJW/IirbPwtRSbxqWO
fZEW4q7AyEWrjQ83nfc8lhLiNV1+b1/G42+L8JJi09A+oxL+hmlM3JHNHQuLp8d+DH6rmeXL
x92H/J46cOEz3wV4KKbyqLGArVEcJAULkRjBmlCnLMVI78i1aAkQLAhFIDGUQomUOgMy0j1e
BnpOIVRcWAcuq2EIXwkQhWaMKm/srTCs5XRXwXuGF9FitiDGnTCemeVQxutB7CBE1JuewMFM
4EYFxcBqwxjW4Mah3E2DhSiNnBSjJHCQilIHcvjJFSoBNDEpuAegTGGWSCDF0txmjZSK6Wal
VaFRVyrZbna88zv2vASpgJhkMgTjOtOuKY/Tp6imq80yO1FgU6+DMPOpJSLxGB7SnwW950aA
xRiZNsH5l7M6l0kxJM3IptOnbjkF/AiI8/P7Xc9gyoz0ry8wcis0X3XMYSEJtOxmF2wJRhlz
g94jQgHam6Sso4hBnSryO6Agwk9JdKRvGjEPfLMw5X+TbrAfCcoLqGmUxQWtqj34KJnkej2h
2A0HqkssRKmXf3YBNCy22kkTZvuhGZF6pYWwWIIYGdiUmDGEoJrsg2QlxNCvY7PJ4762NG+8
ONNFCQlgnCGiXlMpC4IObz2GfJB+6wGUUeSjzFwWz66he3dZdykYrJFEZgO2S0tejhdQsQHy
NJNpC+lVM100HncWTmUvWBKttCysDGwbQOpVsY7cclkZmgJk8G2oZDQskwsxttNp9kShxBEe
M2rkJElN9aPYEzA/JP2YzndXm6M2KxEVR6AIygi4MXa1fU8FgBfLUGrrlYjkqWkM3tI5qT4t
0PxlP9exb9e+bpudlD7dqXRXHky1TsqdVykm+JonrLjg0r17rQHMhYaXeNgxtu3n8ojGwEfp
HwDSoNDGJpgx/Gn4+fP4KRyu4X4nvWOnGI1BFZBxOSmRrDceUZ5XL32jC5FNm3auVJ5tCqm2
UEOzrYfuJG8kUFDPd35G14mQuziloySGMYNSkxLlQcKgSKMY2z3cz3rVaYOnnolemPzHOHSx
aKTWRgWsaniQMMy7MQuaJCrLaZFqkcE6E50SvYlSAj3nvkSTROFfcjeRx1AHF4pbximev2wJ
YYDZp03ZOcxzAtupeFBkFRSTxM7HINHKA0JKURh4iMiRKVXO7ni9iTl6RS4VAUqFajHhwAqD
bbQ0UICGAMS9trDQBEVOFWWr2Nx7PLLPaSOEIntk0yqUxIJu8LfccyjM7X9iKEWGPpvXn2z9
ZNWsh4sMagNSggak4GxN0yQZ2koFSTVlMiZNNsa5teKGEUQLRA2CbEHgX0YoepouaLGaM16b
0gsDNQ4xyBEFSESaw2Yc1dvbjp+iwc2C72trbBsdPQAXepgZ7ZpoFIC/xdnMBDHJwOhRrshG
YyJSdOWnnESH0qIQ0zgYnuBkqSdfvBCYt+gkU0kFJakrebu2YBUIfaju0hcMsy9OCx1AoxYN
g5GZncMXn8iL++fMjlybCzhH8q9CtSXTjVKoKBBUZDVIkpsquHm672J256hkMRUUKYzC5/I5
ja0hRpAdhufNDK8e8OT1pUOe2SqvVoRKCEHQF66TefWfLBM47gNd994Gmks5Qsn7s3zdZHbB
Eoi1XZ8FU0uOaZUD5gyMc9Shg3bEMcBt1bKug0hNVkXTSDZphOmpWqKJNkHVLxNUO0HHaqE/
QYLVRnRlheZdbvR4szQA0ZhpkbLuHw2hZsdjYdLbXjT15TtOjRoLA2TBwq0awQ+DlpDRbcs+
g8c5rY1QoBmaFtSOjrautoOCxlimloCOLIvuuLmzcDmIsX1DBl87VtZGsffrl6zIhxzT4lLs
jteaEsXp1VNsp9W2FmBiI7MWwtMT0k72ZMrRVdM1s3b4eF9Tw1lu3UxtUG8Q9wctdvcdeYxr
3vht9Es5KzdioSpki4Whn6HMytN0MHsUkjO7ORj5bkL4CRS6zVhXII7UJ/FMUjmN7hSrKQND
SrMNRYwY8sAWCQQpQzDaiK9EJQTyXByZJ3pNbvikxCZ72bVFSmhw0Dl+QVLQ4F4WtnDVfFDk
MzLK7vaBm8S5WHk8sWVVV6hdoyJCXMjIuUixhbML33lRFTQWwvXQEaND0sKpRBi16WWcOhHR
pHpvjCDwHI5begWEkBkVVJbJItVbNevtZDPhfQmwQ2bGqrSMszaaTSRUuSjBLgnNWwYMxt8S
rbOLMxnL0jwWjnlz3p+TCoZzQNqzv+/1Ho/LcHA01jpKFv8oyz6Sy5ZC4oWo3y5Iw8lBH9T9
YaQrkc47GtnCWWezAlY0MvoFzSS6A3MMs0LlMhkqqohKrkzi6uoDBjw4hxHHJLYtI2eVo9nc
zChsYktdy2Z3DulvN6YtciHJmSKm1ETWyNL96AO9it30vy0lx7tBwtovqONYduBIW7jhAu2Y
GX05VTuG4yUvzzEC7NL6sz/4u5IpwoSCz05E2A==






--------------47F13F19887B87240BFA50D4--
