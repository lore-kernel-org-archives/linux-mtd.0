Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byZIy-0005nP-H2
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 07:04:21 +0000
Subject: Re: [PATCH 26/26] ubifs: Raise write version to 5
To: Theodore Ts'o <tytso@mit.edu>, Michael Halcrow <mhalcrow@google.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, alexcope@google.com
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-27-git-send-email-richard@nod.at>
 <20161021173154.GB17121@google.com>
 <20161021174758.wz7xrulokicuhlht@thunk.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <b7909fac-9ebe-613c-77ca-0a7fcd494e46@nod.at>
Date: Mon, 24 Oct 2016 09:03:56 +0200
MIME-Version: 1.0
In-Reply-To: <20161021174758.wz7xrulokicuhlht@thunk.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ted,

On 21.10.2016 19:47, Theodore Ts'o wrote:
> On Fri, Oct 21, 2016 at 10:31:54AM -0700, Michael Halcrow wrote:
>>> diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
>>> index bdc7935a5e41..e8c23c9d4f4a 100644
>>> --- a/fs/ubifs/ubifs-media.h
>>> +++ b/fs/ubifs/ubifs-media.h
>>> @@ -46,7 +46,7 @@
>>>   * UBIFS went into mainline kernel with format version 4. The older formats
>>>   * were development formats.
>>>   */
>>> -#define UBIFS_FORMAT_VERSION 4
>>> +#define UBIFS_FORMAT_VERSION 5
>>
>> Alex Cope is working on a fix for file name encryption in ext4 so that
>> common plaintext prefixes don't result in common ciphertext prefixes.
>> Older kernels will not be able to read the new file names.
> 
> To be clear, this will be done in the context of a new encryption
> mode.  In terms of how Ubifs will handle things, that's going to
> depend on whether ubifs uses a single major version number or whether
> they have a feature bitmask like other filesystems, including ext4.

With write version 5, UBIFS has a real feature bitmask.
UBIFS has a feature bitmask since ever but never enforced it.
i.e. you could set bits which are unknown to UBIFS and it sill mounted.
Now UBIFS will refuse to mount when features are set which are not known/enabled
by this implementation.

Maybe I'll add another bitmap just for crypto do be able to support different cipher
modes.

Thanks,
//richard
