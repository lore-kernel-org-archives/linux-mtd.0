Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYyt5-0002nG-Is
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 11:45:12 +0000
Message-ID: <4EE1F4C6.5000104@st.com>
Date: Fri, 09 Dec 2011 11:45:10 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH (mtd-www) 08/13] nand-data: fix ID Length for Hynix
 "HY27US{08, 16}12(1/2)B" devices
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
 <1323173269-19931-7-git-send-email-angus.clark@st.com>
 <1323173269-19931-8-git-send-email-angus.clark@st.com>
 <CAN8TOE9j=R=Wcr7VWR5hjM+i2RmB-THak+s7eDGqTvdr5SZWxQ@mail.gmail.com>
In-Reply-To: <CAN8TOE9j=R=Wcr7VWR5hjM+i2RmB-THak+s7eDGqTvdr5SZWxQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 12/07/2011 07:52 PM, Brian Norris wrote:
> On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
>> Fix ID Length for Hynix "HY27US{08,16}12(1/2)B" devices, from '4' to '2',
>> according to datasheet I have, and READID listed in the table.
> 
> My typo again. Thanks for the catch.
> 
>> -"Hynix","HY27US1612(1/2)B","0xAD","0x56","0xAD56",64,512,16,"16 KB","x16","N/A","1st or 2nd page (3rd word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,4,"ID Table",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"This is the ONLY x16 chip that uses byte 6 (""word 3"") for BBM"
>> +"Hynix","HY27US1612(1/2)B","0xAD","0x56","0xAD56",64,512,16,"16 KB","x16","N/A","1st or 2nd page (3rd word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,2,"ID Table",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"This is the ONLY x16 chip that uses byte 6 ('word 3') for BBM"
> 
> Note that you're changing the note from:
> 
> This is the ONLY x16 chip that uses byte 6 ("word 3") for BBM
> 
> to
> 
> This is the ONLY x16 chip that uses byte 6 ('word 3') for BBM
> 
> I don't mind. Just FYI.

Yes, sorry, I should have mentioned that in the log.  The change was to
accommodate my simple CSV parser (part of the test framework, still to be
submitted) which couldn't handle the double quotes.  The change is actually:

"This is the ONLY x16 chip that uses byte 6 (""word 3"") for BBM"
to
"This is the ONLY x16 chip that uses byte 6 ('word 3') for BBM"

Cheers,

Angus
