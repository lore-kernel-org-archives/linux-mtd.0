Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TB4oF-0007Rx-VB
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2012 14:17:56 +0000
From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH] mtd:nand:clk: preparation for switch to common clock
 framework
Date: Mon, 10 Sep 2012 14:17:47 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7041B81C0@DFLE12.ent.ti.com>
References: <1346350624-27291-1-git-send-email-m-karicheri2@ti.com>
 <20120907212853.20289.86031@nucleus>
 <3E54258959B69E4282D79E01AB1F32B7041B73E9@DFLE12.ent.ti.com>
 <CAN8TOE8tpyPK2V4=YQWP7bK7e5AqFDE27EBpKhn0hj-u6r3HAA@mail.gmail.com>
In-Reply-To: <CAN8TOE8tpyPK2V4=YQWP7bK7e5AqFDE27EBpKhn0hj-u6r3HAA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Mike Turquette <mturquette@linaro.org>,
 "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> -----Original Message-----
>> From: Brian Norris [mailto:computersforpeace@gmail.com]
>> Sent: Friday, September 07, 2012 8:44 PM
>> To: Karicheri, Muralidharan
>> Cc: Mike Turquette; dwmw2@infradead.org; artem.bityutskiy@linux.intel.co=
m;
>> dbaryshkov@gmail.com; linux-mtd@lists.infradead.org; linux-kernel@vger.k=
ernel.org
>> Subject: Re: [PATCH] mtd:nand:clk: preparation for switch to common cloc=
k framework
>>=20
>> On Fri, Sep 7, 2012 at 2:56 PM, Karicheri, Muralidharan
>> <m-karicheri2@ti.com> wrote:
>> > How do these patch get to upstream? Does this get merged through davin=
ci maintainer
>> or through individual subsystem maintainers?
>>=20
>> I think this driver would be taken by David Woodhouse in his linux-mtd
>> repo. Usually Artem Bityutskiy gleans the mailing list of patches and
>> puts them in his l2-mtd-2.6 git repo to help David out. Give it some
>> time, and I'm sure they'll be taking it. We don't really have a
>> full-time maintainer!
>>=20
>> Brian

Thanks Brian for your response. Understood. Will wait.

Murali Karicheri
Software Design Engineer
