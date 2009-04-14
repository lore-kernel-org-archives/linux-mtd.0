Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LthQn-0002yk-Fe
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 12:08:08 +0000
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: Vaibhav AGARWAL <vaibhav.agarwal@st.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Tue, 14 Apr 2009 17:34:46 +0530
Subject: RE: Size of Samsung NAND id 0xD5 in nand_flash_ids[]
Message-ID: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB12CC085F9E@EXGMBX01.sasken.com>
References: <49E46F86.8070301@st.com>
In-Reply-To: <49E46F86.8070301@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vaibhav,

In 32 bit operation, max data can be represented upto 4GiB - 1. In this giv=
en condition you can map the pages of size 4GiB - 1=20
 (As highest msb in 32 bit operation is represented by 2^31 only);

Regards,
Ravi Kumar

________________________________________
From: linux-mtd-bounces@lists.infradead.org [linux-mtd-bounces@lists.infrad=
ead.org] On Behalf Of Vaibhav AGARWAL [vaibhav.agarwal@st.com]
Sent: Tuesday, April 14, 2009 16:42
To: linux-mtd@lists.infradead.org
Subject: Size of Samsung NAND id 0xD5 in nand_flash_ids[]

Hi,

I m using Samsung K9WBG08U1M NAND. And after looking at Samsung's
product decoder sheet, I can decode it's size as 4GiB. However, on
matching it's signature id i.e. 0xD5 in 'nand_flash_ids[]' table, I can
see it's size defined to be 2GiB by mtd framework. Is there any specific
reason for doing so?

Regards,
Vaibhav.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
SASKEN BUSINESS DISCLAIMER
-------------------------
This message may contain confidential, proprietary or legally privileged in=
formation. In=20
case you are not the original intended Recipient of the message, you must n=
ot, directly or=20
indirectly, use, Disclose, distribute, print, or copy any part of this mess=
age and you are=20
requested to delete it and inform the sender. Any views expressed in this m=
essage are=20
those of the individual sender unless otherwise stated. Nothing contained i=
n this message=20
shall be construed as an offer or acceptance of any offer by Sasken Communi=
cation=20
Technologies Limited ("Sasken") unless sent with that express intent and wi=
th due=20
authority of Sasken. Sasken has taken enough precautions to prevent the spr=
ead of=20
viruses. However the company accepts no liability for any damage caused by =
any virus=20
transmitted by this email
