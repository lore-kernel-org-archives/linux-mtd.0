Message-ID: <4C7CA278.9040902@st.com>
Date: Tue, 31 Aug 2010 12:04:32 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 28/74] Incrementing the ecc_pos array to contain 128 char
References: <07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>	
	<a750eadbd743c3a2d5dc8b35c25e0ee82f569e87.1283161023.git.viresh.kumar@st.com>
	<1283170469.12995.53.camel@brekeke>
In-Reply-To: <1283170469.12995.53.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Pratyush ANAND <pratyush.anand@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>,
	Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Deepak SIKRI <deepak.sikri@st.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/30/2010 5:44 PM, Artem Bityutskiy wrote:
> On Mon, 2010-08-30 at 16:13 +0530, Viresh KUMAR wrote:
>> From: Vipin Kumar <vipin.kumar@st.com>
>>
>> For a page size of 4096, the number of oob bytes are 128 per page. This demands
>> for an increased ecc_pos array as well as ecc can be placed at more than 64
>> locations.
>>
>> This patch is added because SPEAr platforms NAND controller has 13 bytes of ecc
>> for each 512 bytes of data. This results in 104 bytes of ecc in case of 4096
>> byte page.
>>
>> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
>> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> 
> Nack, breaking ABI Is not allowed in Linux.
> 
Hello Artem,

I could not understand your point. Can you please elaborate. How does this patch 
break ABI

Regards
Vipin
