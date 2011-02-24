Received: from eu1sys200aog106.obsmtp.com ([207.126.144.121])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsYK0-0001Nt-Jb
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 10:21:21 +0000
Message-ID: <4D66310B.1050706@st.com>
Date: Thu, 24 Feb 2011 15:50:59 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH] Newly erased page read workaround
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
	<20110224093800.GA7880@parrot.com>
In-Reply-To: <20110224093800.GA7880@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	Viresh KUMAR <viresh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/24/2011 3:08 PM, Ivan Djelic wrote:
> On Thu, Feb 24, 2011 at 06:10:16AM +0000, Viresh Kumar wrote:
>> From: Vipin Kumar <vipin.kumar@st.com>
>>
>> A newly erased page contains ff in data as well as spare area. While reading an
>> erased page, the read out ecc from spare area does not match the ecc generated
>> by fsmc ecc hardware accelarator. This is because ecc of data ff ff is not ff
>> ff. This leads to errors when jffs2 fs erases and reads back the pages to
>> ensure consistency.
>>
>> This patch adds a software workaround to ensure that the ecc check is not
>> performed for erased pages. An erased page is checked by checking data as ff ff.
> 
> Hello Vipin,
> 

Hello Ivan,

> Just a suggestion: maybe you could mention in your comments the fact that you
> cannot workaround the problem using a mask to get a valid ECC on erased pages,
> because your controller does not allow it ?
> 
> If you plan to use your workaround on recent NAND devices with UBIFS, you may
> still experience problems because of uncorrected bitflips on erased pages, and
> get errors such as:
> 

Let me explain the problem again.

The problem is that the BCH algorithm (used by this controller to generate ecc 
and correct bitflips) generates an ecc which is not 0xffff for an erased 512 
bytes.

Since erasing a page results in all data including the spare area of the page 
resetting to 0xffff, and the ecc written in the spare area is incorrect.
This ecc is not useful to correct bitflips

One way to solve this problem is to write the correct ecc in the erased pages 
spare area. The other is to ensure that the page is erased and not run the 
correction algorithm. We are using the second option but there would not be 
any unwanted bitflips in any of the cases.

Let me know if this answers your questions

> UBIFS error (pid 576): ubifs_scan: corrupt empty space at LEB 509:126586
> UBIFS error (pid 576): ubifs_scanned_corruption: corruption at LEB 509:126586
> UBIFS error (pid 576): ubifs_scan: LEB 509 scanning failed
> UBIFS warning (pid 576): ubifs_ro_mode: switched to read-only mode, error -117
> 
> Regards,
> 
> Ivan
> .
> 

Regards
Vipin
