Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aDFA-0000lZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 11:31:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1028147069.12139.81.camel@mahi190.austin.ibm.com> 
References: <1028147069.12139.81.camel@mahi190.austin.ibm.com>  <1028064443.23642.52.camel@mahi190.austin.ibm.com> <20020731163530.70c45960.stuart.menefy@st.com> 
To: Stephen Hui <gromit1463@mailworks.org>
Cc: linux-mtd@lists.infradead.org, stuart.menefy@st.com
Subject: Re: "Read-only file system" error while writing 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Aug 2002 11:31:40 +0100
Message-ID: <28851.1028197900@redhat.com>
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

gromit1463@mailworks.org said:
>  they all call do_write_buffer().  I was looking at the specsheet for
> my STMicro chips, and I didn't see any mention of Write-to-Buffer
> (command 0xE0) which is in the Intel command set, and issued by
> do_write_buffer().  Is this command supported on the STMicro chips?
> Could non-support contribute to my problem? 

We should be checking the CFI table for buffer-write support and not trying 
to use it if it's not present. Can you check the datasheet for the chip 
agrees with the built-in CFI table?

--
dwmw2
