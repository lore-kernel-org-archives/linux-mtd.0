Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dWiWe-00043V-Bk
 for linux-mtd@lists.infradead.org; Sun, 16 Jul 2017 12:19:54 +0000
Subject: Re: [PATCH 2/4] ubifs: Fix unlink code wrt. double hash lookups
From: Richard Weinberger <richard@nod.at>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, kernel-team@lge.com,
 Artem Bityutskiy <dedekind1@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20170209212837.14197-1-richard@nod.at>
 <20170209212837.14197-2-richard@nod.at> <20170309070439.GA31469@sebu>
 <cd4c5713-d091-3445-071e-d880c40710d9@nod.at>
 <CAMuHMdUHF-YSZ8=E3u6GRudJfvgpcGHjoEitf6YvrkHqT6guBg@mail.gmail.com>
 <dc60f428-9589-e1d1-d903-e8af0d96bf9c@nod.at>
Message-ID: <ccfcd407-ecb8-d6c1-ae24-2cac4287f8d9@nod.at>
Date: Sun, 16 Jul 2017 14:19:29 +0200
MIME-Version: 1.0
In-Reply-To: <dc60f428-9589-e1d1-d903-e8af0d96bf9c@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Am 16.07.2017 um 14:17 schrieb Richard Weinberger:
> Geert,
> 
> Am 16.07.2017 um 14:12 schrieb Geert Uytterhoeven:
>> Hi Richard,
>>
>> On Sun, Mar 19, 2017 at 9:46 PM, Richard Weinberger <richard@nod.at> wrote:
>>> Am 09.03.2017 um 08:04 schrieb Hyunchul Lee:
>>>>> -    int n, err, type = key_type(c, key);
>>>>> -    struct ubifs_znode *znode;
>>>>> +    int err;
>>
>>     fs/ubifs/tnc.c: In function ‘search_dh_cookie’:
>>     fs/ubifs/tnc.c:1893: warning: ‘err’ is used uninitialized in this function
>>
>> None of Hyunchul's review comments below ended up in commit 781f675e2d7ec120
>> ("ubifs: Fix unlink code wrt. double hash lookups")?
> 
> Oh, that was not indented.

*intentional ;)
