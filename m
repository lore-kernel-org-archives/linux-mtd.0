Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eF3vM-0003fM-Dm
 for linux-mtd@lists.infradead.org; Wed, 15 Nov 2017 20:04:43 +0000
Received: by mail-wm0-x22d.google.com with SMTP id g141so5328739wmg.2
 for <linux-mtd@lists.infradead.org>; Wed, 15 Nov 2017 12:04:18 -0800 (PST)
Subject: Re: UBIFS does not mount after powerfail
From: Manfred Spraul <manfred@colorfullife.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <5883680.7ftK6mdJzr@blindfold>
 <79c9281e-9622-7aec-b3a2-cf7cec1f1e3f@colorfullife.com>
 <2158047.TxtlGbeyNK@blindfold>
 <f84e49bb-a870-c519-6224-cf15dce9ce24@colorfullife.com>
Message-ID: <4fafb954-2b57-1b7a-cfc9-85d379c0aa57@colorfullife.com>
Date: Wed, 15 Nov 2017 21:04:14 +0100
MIME-Version: 1.0
In-Reply-To: <f84e49bb-a870-c519-6224-cf15dce9ce24@colorfullife.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
On 11/14/2017 07:49 PM, Manfred Spraul wrote:
> Hi Richard,
>
> On 11/13/2017 10:06 PM, Richard Weinberger wrote:
>>
>> No, the image that contains the first logical error.
>> UBIFS can mount even if there are many problems with the structure.
>> Therefore I need you to enable chk_fs.
> Done - and I even found a 2nd instance where the image got bad:
> https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/
>
Sorry for the self-reply, I did another test:
I applied "ubifs: replay: Detect and kill orphaned xattrs", i.e. 
https://patchwork.ozlabs.org/patch/780667/.

Finding 1: It does not help
Finding 2: I get for some images lots of "UBIFS error (ubi0:0 pid 
13670): ubifs_replay_journal: Expected ino node, got: 1/2/3"

The last good image is e.g. 164908, the first image with such messages 
is 164909:
https://sourceforge.net/projects/calculix-rpm/files/ubifs/kill_xattr/

And, perhaps it helps to understand the issues:
The stress test is parallel, i.e. 4 parallel bash scripts that do 
something like "touch a b c ;rm c; mv a b;".

--
     Manfred
