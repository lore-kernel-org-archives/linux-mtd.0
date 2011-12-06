Received: from eu1sys200aog104.obsmtp.com ([207.126.144.117])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtnQ-0004eP-8J
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:06:52 +0000
Message-ID: <4EDE0552.4010501@st.com>
Date: Tue, 06 Dec 2011 12:06:42 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V3 3/6] MTD : add the database for the NANDs
References: <1301474413-28821-1-git-send-email-b32955@freescale.com>
 <1301474413-28821-4-git-send-email-b32955@freescale.com>
 <201103301046.04357.ffainelli@freebox.fr> <4D92F277.7060607@freescale.com>
 <1301566248.2828.40.camel@localhost>
 <AANLkTi=59br1KueZupGevB4DgP7UqBKRgbGgRvsjgH-8@mail.gmail.com>
 <CAN8TOE9-iEPyWXLsxddeofazgrCWDWKgrx6eBkr7vdKErfgeCA@mail.gmail.com>
 <4E730494.7030509@st.com>
 <CAN8TOE_87PvCbSemkM5auioo1z0FDTnmoQ813N9Xj09O36S2rA@mail.gmail.com>
In-Reply-To: <CAN8TOE_87PvCbSemkM5auioo1z0FDTnmoQ813N9Xj09O36S2rA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 11/21/2011 10:18 PM, Brian Norris wrote:
> 
>> I have also added a few more devices and columns to the table (#CS,
>> #LUNs, #RBn) which I hope to submit shortly.
> 
> Might be useful. Patch it against the CSV in mtd-www.git
> (nand-data/nanddata.csv) please.
> 

Just about send the patches to the list...

>> the table!) would be a good start?
> 
> Perhaps. If you have an easily testable framework for validating
> against the CSV table from mtd-www.git, then it could be useful.

I will update the test framework to work with the CSV table and post the result
here... probably not until next week now...

Cheers,

Angus
