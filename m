Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d08zh-00050K-Fy
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 15:55:15 +0000
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>
References: <1490864181-2192-1-git-send-email-richard@nod.at>
 <cd165532-9425-bc93-a28e-b7d383508b62@intel.com>
 <ab0a0797-7074-d53b-5863-38a84ca2a594@nod.at>
 <4c7a176b-6132-7936-a04f-d4def5e56320@nod.at>
 <646ae733-5037-3072-7151-b055a8fa1521@intel.com>
 <cbaff214-7431-2cd1-2453-156d716c0d8a@nod.at>
 <CAOQ4uxh5mZ8gCk1U=oV9b+j3k0RFcT3LozATfa3qHoYy+OMVsg@mail.gmail.com>
 <92bbb4d1-afe7-14f2-763b-051c7b12ff9e@nod.at>
 <ae2f884b-17dc-cd24-f2a5-34c6c2aa7e8c@nod.at>
 <CAOQ4uxhaYfO3m6kQ1agDg2Bm-6Xh9yxoPh93m=xpTz39gXjpAQ@mail.gmail.com>
 <2a2eebef-ed37-7829-b08f-482039306a6e@nod.at>
 <CAOQ4uxivNMjZJ3T_NmPHXNveXbs+QX=PxUkHagu9VH5Ev5Uecg@mail.gmail.com>
 <20170417172738.199803f5@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "stable [v4.9]" <stable@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <3155babe-e3ed-b4bd-dc02-60d4c23e820d@nod.at>
Date: Mon, 17 Apr 2017 17:54:44 +0200
MIME-Version: 1.0
In-Reply-To: <20170417172738.199803f5@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.04.2017 um 17:27 schrieb Ralph Sennhauser:
> Hi Amir, Richard
> 
> Looks like the fix didn't make it into 4.11-rc7 either, isn't it time
> to just disable O_TMPFILE support in ubifs for now? Giving plenty
> time for the proper fix.

As I said to Amir, don't panic. I'm *very* busy right now with non-computer stuff.
My first fix is correct, I was wrong about the testing, it does the right thing,
although it was not so clear.
Except that my fix misses one error case which I wanted to push tomorrow since today
is a official holiday here in Austria.
For the next merge window I have a better approach which is better than (ab)using
ubifs_jnl_update() for O_TMPFILE.

Thanks,
//richard
