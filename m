Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from out2.prserv.net ([165.87.194.229] helo=prserv.net)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11ro5L-00017g-00
	for mtd@imladris.mvhi.com; Sat, 27 Nov 1999 20:04:43 +0000
From: "Dvir Oren" <dviro@lucidvon.com>
To: MTD <mtd@imladris.mvhi.com>
Date: Sat, 27 Nov 1999 22:08:24 +0200
MIME-Version: 1.0
Content-type: Multipart/Mixed; boundary=Message-Boundary-18649
Subject: 2.2.12 Kernel Patch
Message-Id: <E11ro5L-00017g-00@imladris.mvhi.com>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


--Message-Boundary-18649
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

I'm attaching my own patch of MTD into the 2.2 kernel.

Note the following things:
1.  I only work with Doc2000, so that is the only thing tested.
2.  Even Doc2000 doesn't work for me.  I don't know exactly what 
the problem is, but I don't suspect it's a problem with including it 
into the kernel (see other post to the list)
3.  I've moved the entire MTD structure to drivers/block, instead of 
what it originally was.  This was more convinient for me.
4.  Some changes were needed to be done on the MTD source 
files.  I'm attaching that as well.
5.  Good luck, and tell me if you think something I did was wrong.

---------
Dvir Oren <dvir@lucidvon.com>
Lucid VON Ltd. <http://www.lucidvon.com>
Twin Towers 2,     Suite 406,     P.O.Box 159
35 Jabotinsky street, Ramat-Gan 52511, ISRAEL
Tel:+972 3 6137214         Fax:+972 3 6137215

--Message-Boundary-18649
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any another MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  kernel.patch.gz
     Date:  13 Nov 1999, 17:57
     Size:  1155 bytes.
     Type:  Unknown

--Message-Boundary-18649
Content-type: Application/Octet-stream; name="kernel.patch.gz"; type=Unknown
Content-disposition: attachment; filename="kernel.patch.gz"
Content-transfer-encoding: BASE64

H4sICE18LTgAA2tlcm5lbC5wYXRjaACFVmFv2kgQ/Rz/ilESKVADwYZQcBUpECDiCrgHtKpU
VdbGXid72F66Nlxyv/5mbWzAxBApNuzMm52defuGarUKjmAbKsLbZ4/by9tHHrjspcaCGhfs
5WIoGJh2BNod1OtGQzO0z6B1Oh1FVdUi5MWcRDDlG9AaoGlGs2nUGwno4QGqmlavtECVL02D
hwcFAJ459+AG4r8e5xGE69WKiwhKHgsoERUII8FW1CnfwKM5HY6erEnf6pnmQgGXKaCoIV8L
m+Yy8iNnl5WiKoBBwohEFG5m3Qk4LFymO2Vxe+OvVn/ww0IHBZgLv+Dy+th0Cfdw+X4Jv79A
9EqDgzOMAhYx4kG2RYnhinDKhXuNpqPFrK9Uj5oxIUvqMo9+2As9K+txL1JgvhWdrH9xK1qV
z9gJ+ZR9UGD+vWf1R7N53AjjHlcmZt/KVnHlupR+KyvV7nhcZIQVEcyhinreB7BNcnMFxtai
O3saLKRffI4aifNsNyVj8KnXt4RhLv0DpevScWfKFb8sPSaW2ftrDuo9CKfG5QoNHOYq6val
qLkYk0W/XHkvK2qWLWJlauo4CyUJhf9IyiXGVKkX4gnhOJ84FuYR2w5KmMaELKH0pRQdamya
3+LMjvnheZb413r2ljW7gCLNdhFF9rAHLGkY9TtD32OJHrMEn60tS24/YTk/weKVgqB/1jSM
qng917itzYOIsCAE4nkQUJuGIRHv4JCIKFWERBw8ThwgEAjgLoTUjrgIgQVo8anPxbsMfauA
vKbMhm3c7TYyrLX9HP6azqzZ4O/vg/ni9xdMKyZKuxMzpd2uNBOqXPiOJa9fqYw+V3Gp87dv
0pcCcsVch2Y2bKCiXkighe2S4JzDdLgYpx6BG3mJy5Zbh657nqcdcVOrbz5q9Xo9BTjcll/P
g/RDkJ6A4BRqPpYat8WEniD+mW3Mx0X3yZymEG5H5IUHZ0A/Jt2fKWLjk7cz7pPRz8kgy8pn
b8iK05De2Hz8utesmN25sx/0XfYWDsN0vyVR4IKs8nSJr50bnhmMdzgbdzdt3z3nqdWN+t7l
ammSsPjsbJVNjrNkpF2Bs2GCP7BnvxZQxOu1Tk1usJtiw+FcB6nz4XsYUX83Nl0uQIpQNmqk
pzWcyyF4ONSmg8XRMFPAx1vs02Bt8VXEeIB3+S2ybO7jWpQW5ORwahp37YN6ZBMpVw7Umtbe
ROrE9ZAvtCcVycnkUV2MXWVyCro99LGsu26on5DvDFck4QkejodKPlIXQ6UZwH4EgiHwTDID
WU4W2N7aobc4WdZvt1KUXz8sa8No6ruyfoA6kPIm6rjR3Pvt1WrEbGtU9KS42FUqAim/QP9L
iL/hzJHk3zM9r2yn0LgKdRo67MCufiine6BMWFPAB7bkHhc5xJpbZDxlSxX1hF0/ZU+Essga
K1yRMRXMwkMnapearzJSbR2lAUcm5kg3zKaW4KUlfrQiwGdFhnE98iL7E3sSx5HjXXoIEjjc
D3Acl6SbT/7hAv3+B59JFCr+CwAA
--Message-Boundary-18649
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any another MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  mtd-kernel.diff.gz
     Date:  13 Nov 1999, 17:54
     Size:  1291 bytes.
     Type:  Unknown

--Message-Boundary-18649
Content-type: Application/Octet-stream; name="mtd-kernel.diff.gz"; type=Unknown
Content-disposition: attachment; filename="mtd-kernel.diff.gz"
Content-transfer-encoding: BASE64

H4sICLV7LTgAA210ZC1rZXJuZWwuZGlmZgCtVm1v2kgQ/hz/imkaNRBs8AskwWmikOBUtGDu
yMtVqiqL4nVYBXapX9JEUf/7za4xNuC0PelQlPXOzuzOzPPM7Po0CEALQUvggYSMzBqXnAX0
vk7ZUqDxkN7nUkXTtC3VnetxDMNJDJYORstuHtlmC4x2u63UarXyfaSJyx/BsEDXbevYNpup
yfk5aIZ6DDVDteD8XNHmY8rmhCUeG88J7A/InIfPcEMmU8Zn/P4ZuuSRTkgElcFNt7qvaAUT
vogpZ8DIU+xN+BxlsaItP/5oK4hDGsXj+BcHp8oQJYsFD+N9uBy6V70PHgoVUIAG8AV293Lh
Lrw5hV22C19PIJ4SlgZ8rLYwYisNGXZ8svDyk92rmz5U3I7bhavZOJrCTThm0WwsY+uPn0m4
fby02Sv6srFpl4YEIfs245MHPw1kPMHYI4g5oAGkwqgY0EV/ePlpfdeAioQT5ot8K/4Wnwbj
BxLQGVmjQSYssimTrTHDsFtHttUuJ1OpBXLpyG5ZOZdMQz2CmvwvUksD8h0qe5U8hqr6XFUA
YPjZG158vIbaKcxjv85hPl4sCH4oQGYR+gqlxvOqUitb8brDS0PXdakB4jd4/QAAzCANlOUg
/G7rqqFDLR2E5xs6oGjbh0qAZEC1Eo/yVRFu0RnJgl9HujR+Ndx8PQ22dPuNGLbp4vOJiUmr
T9aQXkmLhFkJ19rPkW00bd0qZ0ypiW4JE6NAmePjY8GZdBCpf+sj0RgBzyNPNMZ5DgH2Ecpo
7C23rjxy6mOKRJHRCYhlzxMKZVrwglUpdzjBjxR1S9I1HcTRP/E07CH9nnv72btzRte9oetd
DrsOvIdPzsh1+pm0YqqWqlelPkOHYTDs3vYdRUsdCBI2qZS7Wz1RagWlgu+luqvw3wq2QOMA
7sy6VX+Cg4YCc+4nMyI3qxSt0W4b7SCebSAtJUWUpWATYctu6uUIb6kjuuLvsHC5WIcyx8vx
D/HFjX+Dba6xjmsUhwn6gmWAygGHA/wqS8aqTtYzkouLacmla93PtLEBmq/kZsOmkKCjVcXI
jmnpsmXKQaSn0UgjTLEFDQbpB16ieCEuOIa6I36Ng5eXF0ECNND+j58iyIUb5jBkMfwGiw01
AYhsS1hJlZDc4x1IQu/bTFx8lUHn43DkuSO169z1Lh3P7Qwc9Z2AK+CLqFotgYptE5dtMZfl
XFzCYxzizWSbRjk87BXuZm8pAU1TbUOtmcFyAJ0knvLQhu74kfrwD+f+lCdYk+/9H/Mf5vn8
cUrr+Nw5k6WJ+ns934b0IBVdqqc3a8PQG+KUpt3C19shSGNwnhawJw0VDVuK6Chd5+L2Q14u
f42ckdN3OtfYZFYlg+2HTWaJj07MKEueGmmM9enZ9lJKKLEkedcSzz7TUg+z8OQjRgK5fI1A
FCcIhnAqcyKDTyp7cpYvLiEdOX/fOtc3MnIvJN8TEuE7cEPJHVXSQ6r4ouu5w9W0uqWKzXa5
tnXU8OqqsLYRLzKuNA9TH0mZpaHdbMkroJl1p6yDiADxzcZDHw7iKY3E/ERkfCebwalUir6k
/lPGfaKdUS9Ej6rQQAJ+PVG0HaUm+hOWwpvMsAohiZOQgeb03LtOum3aLQ2zKbulYWbtYFlz
hb7GeEwDSsI0wavZKbxIUKTg2ROXiwrubb//M90/L2v2+/bK/lt//Rf/xjUq2gwAAA==

--Message-Boundary-18649--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
