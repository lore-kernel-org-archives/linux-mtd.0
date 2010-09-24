Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz7Un-0005tv-22
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 12:35:21 +0000
Received: by gyh3 with SMTP id 3so20512gyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 05:35:18 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093ED5FC9F@Cloud.RL.local>
References: <AANLkTik6reUk+FiAZO91qdM0V07-QBsys+-eYmbbnXk6@mail.gmail.com>
	<70E876B0EA86DD4BAF101844BC814DFE093ED5FC9F@Cloud.RL.local>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 24 Sep 2010 08:34:43 -0400
Message-ID: <AANLkTik8apy-1+RtD7xN+CHT5HZpY0SBRBP+0T3J9VhM@mail.gmail.com>
Subject: Re: [PATCH 3/4] mtd-utils: new strtoX helpers
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 24, 2010 at 02:13, Jon Povey wrote:
> Mike Frysinger wrote:
>> On Fri, Sep 24, 2010 at 00:31, Jon Povey wrote:
>>> linux-mtd-bounces@lists.infradead.org wrote:
>>>> Simply usage of converting strings to numbers by adding some
>>>> wrappers around the standard strtoX functions. =C2=A0These helpers
>>>> support both hex and dec numbers transparently, and the caller need
>>>> only provide a ptr to an error integer if they want to be notified
>>>> of problems.
>>>
>>>> + */ +#define simple_strtoX(func, type) \
>>>> +static inline type simple_##func(const char *snum, int *error) \
>>>> +{ \
>>>
>>> Why inline? won't this bloat code, better to remove inline?
>>
>> because uninlined static definitions will generate unused warnings
>
> you could do
> __attribute__((unused)) static type simple_##func(...
>
> I assume the compiler will still optimise them away, not sure.
>
> but with the 0xnn handling going away, does this header now offer
> much over just calling strtol et al directly?

that depends on whether you're comfortable breaking out your own
endptr and knowing the exact semantics
-mike
