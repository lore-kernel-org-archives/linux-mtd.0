Received: from eu1sys200aog103.obsmtp.com ([207.126.144.115])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PTY1X-0000xt-70
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 10:59:06 +0000
Message-ID: <4D0B424A.2020105@st.com>
Date: Fri, 17 Dec 2010 16:28:18 +0530
From: viresh kumar <viresh.kumar@st.com>
MIME-Version: 1.0
To: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH V2 25/69] ST SPEAr: Add smi driver for serial NOR flash
References: <cover.1285933331.git.viresh.kumar@st.com>
	<238bd0ff57f8530c597157bc07f6c46dc362e1bc.1285933331.git.viresh.kumar@st.com>
	<4CBD32EB.5050409@st.com> <4CCAB4D8.90807@st.com>
In-Reply-To: <4CCAB4D8.90807@st.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Pratyush ANAND <pratyush.anand@st.com>, viresh kumar <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	Vipin KUMAR <vipin.kumar@st.com>, Shiraz HASHIM <shiraz.hashim@st.com>,
	Amit VIRDI <amit.virdi@st.com>, Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	Deepak SIKRI <deepak.sikri@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/29/2010 05:19 PM, viresh kumar wrote:
> On 10/19/2010 11:25 AM, viresh kumar wrote:
>> On 10/01/2010 05:25 PM, Viresh KUMAR wrote:
>>> From: Shiraz Hashim <shiraz.hashim@st.com>
>>>
>>> SPEAr platforms(spear3xx/spear6xx/spear13xx) provide SMI(Serial Memory
>>> Interface) controller to access serial NOR flash. SMI provides a simple
>>> interface for SPI/serial NOR flashes and has certain inbuilt commands
>>> and features to support these flashes easily. It also makes it possible
>>> to map an address range in order to directly access (read/write) the SNOR
>>> over address bus. This patch intends to provide serial nor driver support
>>> for spear platforms which are accessed through SMI.
>>>
>>> Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
>>> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
>>> ---
>>>  arch/arm/plat-spear/include/plat/smi.h |   68 ++
>>>  drivers/mtd/devices/Kconfig            |    7 +
>>>  drivers/mtd/devices/Makefile           |    1 +
>>>  drivers/mtd/devices/spear_smi.c        | 1122 ++++++++++++++++++++++++++++++++
>>>  4 files changed, 1198 insertions(+), 0 deletions(-)
>>>  create mode 100644 arch/arm/plat-spear/include/plat/smi.h
>>>  create mode 100644 drivers/mtd/devices/spear_smi.c
>>
>> David,
>>
>> Any review comments on this patch??
>>
> 
> David,
> 
> Any review comments??
> 

David,

Is this patch OK? Actually i have sent this patch as part of a big patchset.
And my whole patchset is on hold untill i get this acked.
Please see if you can get some time to review this patch.

--
viresh
