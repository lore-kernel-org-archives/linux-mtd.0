Received: from v031479.home.net.pl ([89.161.171.237])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SCBVA-0005rd-Ht
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2012 15:06:38 +0000
Message-ID: <4F7085EE.60205@flytronic.pl>
Date: Mon, 26 Mar 2012 17:06:22 +0200
From: =?UTF-8?B?TWljaGHFgiBXcsOzYmVs?= <Michal.Wrobel@flytronic.pl>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: ixp4xx: fix partition parser argument
References: <20120326133735.GA19800@FLYC077.flytronic.local>
 <1332772726.22278.34.camel@sauron.fi.intel.com>
In-Reply-To: <1332772726.22278.34.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26.03.2012 16:38, Artem Bityutskiy wrote:
> On Mon, 2012-03-26 at 15:37 +0200, Michał Wróbel wrote:
>> Commit c7975330154af17aecc167b33ca866b6b3d98918 ("mtd: abstract last MTD
>> partition parser argument") moved the "origin" argument into struct
>> mtd_part_parser_data, but didn't update its only user: ixp4xx.c.
>>
>> Signed-off-by: Michał Wróbel <michal.wrobel@flytronic.pl>
>> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> Cc: Artem Bityutskiy <dedekind1@gmail.com>
>> ---
>>  drivers/mtd/maps/ixp4xx.c |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
> Thanks, but we already have a fix scheduled in the l2-mtd.git tree:
>
> http://git.infradead.org/users/dedekind/l2-mtd.git/commit/87cd5901e82658b49357f41d27b0acbe454b1a3f
Oh, that's right. I should have searched for an existing solution before
finding it on my own.

-- 
Kind regards,
Michał Wróbel
