Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYeGn-0000Zp-GA
 for linux-mtd@lists.infradead.org; Wed, 14 Nov 2012 14:48:50 +0000
Message-ID: <50A3AF4A.9010004@parrot.com>
Date: Wed, 14 Nov 2012 15:48:42 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Angus CLARK <angus.clark@st.com>
Subject: Re: state of support for "external ECC hardware"
References: <20121029204227.GA32300@harvey-pc.matrox.com><509B9143.4020506@keymile.com><20121108152125.GR2389@harvey-pc.matrox.com><509BDE9B.3080909@keymile.com><alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com><50A12FBD.8020801@keymile.com><20121112173515.GA3041@parrot.com><50A13461.7070304@keymile.com>
 <20121112185231.GA6843@parrot.com> <50A36E92.7070204@keymile.com>
 <50A39B9B.7020808@st.com>
In-Reply-To: <50A39B9B.7020808@st.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "Bigler, Stefan" <Stefan.Bigler@keymile.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 Gerlando Falauto <gerlando.falauto@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, Christopher Harvey <charvey@matrox.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Angus CLARK a écrit :
> Hi Gerlando,
> 
> On 11/14/2012 10:12 AM, Gerlando Falauto wrote:
>> Hi Ivan,
>>

>>
>> Feasibility aside, would that make any sense?
>>
> 
> In general I am in favour of anything that facilitates the automatic probing of
> devices.  However, I can see a number of complications in trying to implement
> what you suggest.  Storing static information in a fixed location is never a
> good idea on NAND.  A further issue relates to the very information you are
> trying to store.  The data itself would need to be protected by ECC, but for it
> to be useful, you need to be able to retrieve it without knowing what ECC/layout
> was used when storing it.  Perhaps, for this ECC/layout data, one could use a
> special dedicated S/W ECC scheme, strong enough for any device.  Yet another
> layout of complexity though.
You can use what is used on onfi flash for read parameter data [1] :
- duplicate data over n page
- use crc to detect corruption



Matthieu

[1]
The host should issue the Read Parameter Page (ECh) command. This command returns
information that includes the capabilities, features, and operating parameters
of the device.
When the information is read from the device, the host shall check the CRC to
ensure that the
data was received correctly and without error prior to taking action on that data.
If the CRC of the first parameter page read is not valid (refer to section
5.7.1.24), the host should
read redundant parameter page copies. The host can determine whether a redundant
parameter
page is present or not by checking if the first four bytes contain at least two
bytes of the
parameter page signature. If the parameter page signature is present, then the
host should read
the entirety of that redundant parameter page. The host should then check the
CRC of that
redundant parameter page. If the CRC is correct, the host may take action based
on the contents
of that redundant parameter page. If the CRC is incorrect, then the host should
attempt to read
the next redundant parameter page by the same procedure.
The host should continue reading redundant parameter pages until the host is
able to accurately
reconstruct the parameter page contents. All parameter pages returned by the
Target may have
invalid CRC values; however, bit-wise majority or other ECC techniques may be
used to recover
the contents of the parameter page. The host may use bit-wise majority or other
ECC techniques
to recover the contents of the parameter page from the parameter page copies
present. When
the host determines that a parameter page signature is not present (refer to
section 5.7.1.1), then
all parameter pages have been read.
