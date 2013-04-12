Received: from eu1sys200aog106.obsmtp.com ([207.126.144.121])
 by merlin.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQbMR-0000Ci-Hd
 for linux-mtd@lists.infradead.org; Fri, 12 Apr 2013 10:37:40 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D2731CE
 for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2013 10:37:36 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 455CC4CC0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2013 10:37:34 +0000 (GMT)
Message-ID: <5167E3EF.9020505@st.com>
Date: Fri, 12 Apr 2013 11:37:35 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Changing the ECC method for a running system (UBI seems to use
 OOB?)
References: <5166E4F8.5030107@ammonit.com>
 <CACwUX0PEfQfNa_Yg5JFEWFsFAC++Y1MgmPmckE5_2KZG8YuEOw@mail.gmail.com>
 <5167D00A.1090006@ammonit.com>
In-Reply-To: <5167D00A.1090006@ammonit.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Just to add one other point, you may need to skip programming "empty" pages when
transcoding the data to the new ECC format.  This will ensure the "empty" pages
can be programmed correctly, when UBIFS attempts to use them.

Cheers,

Angus

On 04/12/2013 10:12 AM, Steffen Kühn wrote:
> Hello David,
> 
>> We had exactly the same issue with our embedded systems (I'm really mad at
>> Micron that they released the 4-bit ECC chips without as much as putting a
>> warning message in the Linux kernel, but that's a separate topic...).
>>
>> Anyhow, we modified the AT91bootstrap loader to convert the entire NAND
>> from 1-bit sw-ecc to on-die 4-bit ECC.  I'd be happy to send a patch to
>> this mailing list if you think this would be useful.
> 
> Yes, this would be great! The patch is certainly also helpful for the
> next with the same problem ...
> 
>>
>> UBI fortunately does not use OOB at all, so there should be no issue from
>> there.
> I have read this too. I'm happy that I have not to deal with YAFFS2.
> 
>>
>> The subpage size has to match though.  In our case, UBI was built for 512B
>> subpage, but when turning on the on-die ECC support, it'd by default only
>> support 2048B pages.  The patch I sent earlier to this mailing list enables
>> 512B subpage writes with on-die ECC.
> 
> That could be my problem. I have not considered this point. Thanks!
> 
> Best regards,
> Steffen
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
-------------------------------------
Angus Clark
ST Microelectronics (R&D) Ltd.
1000 Aztec West, Bristol, BS32 4SQ
email: angus.clark@st.com
tel: +44 (0) 1454 462389
st-tina: 065 2389
-------------------------------------
