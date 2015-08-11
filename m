Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP2xz-0004HU-8l
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 06:23:20 +0000
Received: by obnw1 with SMTP id w1so140892765obn.3
 for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2015 23:22:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55C98A3B.3010405@exertus.fi>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <55C98A3B.3010405@exertus.fi>
Date: Tue, 11 Aug 2015 08:22:57 +0200
Message-ID: <CAFLxGvxQnd+QJUFoqPrDWOf4HJS0nKeBZ20WoPnwumjO5Kv-GA@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Timo Ketola <Timo.Ketola@exertus.fi>
Cc: Andrew Murray <amurray@embedded-bits.co.uk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 11, 2015 at 7:38 AM, Timo Ketola <Timo.Ketola@exertus.fi> wrote:
> Hi,
>
> I have been lurking in this list for a long time and this is my first
> post here. I decided to write because I think I have yet another idea
> for this one:
>
> On 10.08.2015 22:56, Andrew Murray wrote:
>> ...
>>  - My work around for this erased flash issue was to conditionally
>>    encrypt/decrypt only when the input data is not 'all bits set'. This had
>>    minimal impact on UBI/UBIFS/etc but it is possible (though very unlikely)
>>    that the output of an encryption algorithm is 'all bits set' - Thus when you
>>    later attempt to decrypt the 'all bits set' cipher text we incorrectly treat
>>    it as erased flash so return it verbatim and thus cause corruption. I've not
>>    seen this issue occur despite reading and writing more than 50GB of data.
>> ...
>
> Why not postprocess the data so that the encrypted FF becomes FF again
> like this:
>
> Lets say clear text data is I, encrypted data is O, encryption function
> is e() and decryption function is d(). Then, what is normally done, is
> of course:
>
> Write: O = e(I)
> Read: I = d(O)
>
> Calculate F = ~e(FF), where F is encrypted and inverted version of 'all
> bits set' (FF) data, and modify writing and reading:
>
> Write: O = e(I) ^ F
> Read: I = d(O ^ F)
>
> Now encrypting FF input results in FF output and vice versa.
>
> Just wanted to introduce an idea.

But wouldn't that only work for ECB cipher mode?

-- 
Thanks,
//richard
