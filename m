Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aKg6-0001cA-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 19:28:02 +0100
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with SMTP id 78CF14981
	for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2002 18:27:32 +0000 (GMT)
Received: from thistle.bri.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB9BF1845
	for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2002 18:26:25 +0000 (GMT)
Received: from [164.129.14.5] (helo=ocelot)
	by thistle.bristol.st.com with smtp (Exim 3.03 #5)
	id 17aKeX-0007gh-00
	for linux-mtd@lists.infradead.org; Thu, 01 Aug 2002 19:26:25 +0100
Date: Thu, 1 Aug 2002 19:26:24 +0100
From: Stuart Menefy <stuart.menefy@st.com>
To: linux-mtd@lists.infradead.org
Subject: Re: "Read-only file system" error while writing
Message-Id: <20020801192624.28fe7b7e.stuart.menefy@st.com>
In-Reply-To: <20020801190500.7e73cf60.stuart.menefy@st.com>
References: <1028147069.12139.81.camel@mahi190.austin.ibm.com>
	<1028064443.23642.52.camel@mahi190.austin.ibm.com>
	<20020731163530.70c45960.stuart.menefy@st.com>
	<28851.1028197900@redhat.com>
	<20020801190500.7e73cf60.stuart.menefy@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 1 Aug 2002 19:05:00 +0100
stuart.menefy@st.com wrote:
> On Thu, 1 Aug 2002 11:31:40 +0100
> dwmw2@infradead.org wrote:
> > gromit1463@mailworks.org said:
> > >  they all call do_write_buffer().  I was looking at the specsheet for
> > > my STMicro chips, and I didn't see any mention of Write-to-Buffer
> > > (command 0xE0) which is in the Intel command set, and issued by
> > > do_write_buffer().  Is this command supported on the STMicro chips?
> > > Could non-support contribute to my problem? 
> > 
> > We should be checking the CFI table for buffer-write support and not trying 
> > to use it if it's not present. Can you check the datasheet for the chip 
> > agrees with the built-in CFI table?
> 
> Yes, the CFI data for this field is right (ie the device does not support
> Block writes). So I don't think this should be the problem.

Sorry, I should have read the email more closely before replying.

For the M28W320CB which I'm using, the CFI data is correct, in that it
reports that the device does not support Block writes. Stephen is using the
M28W320CT, which will have different CFI data, so maybe it is reporting that
it is supported?

The datasheet is no use in this respect, in its listing of the CFI data it
gives times for buffer-writes, which the device does not support!

Try building cfi_probe.c with DEBUG_CFI set, and post what it reports.

Stuart

-- 
Stuart Menefy                                        stuart.menefy@st.com
STMicroelectronics Ltd                         ST Intranet: mo.bri.st.com
Bristol, UK                         Rest of the World: www.linuxsh.st.com
