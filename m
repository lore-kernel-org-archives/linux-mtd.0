Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFNOI-0004Bz-Nx
 for linux-mtd@lists.infradead.org; Thu, 16 Nov 2017 16:51:55 +0000
Received: by mail-wr0-x22c.google.com with SMTP id y42so23425740wrd.3
 for <linux-mtd@lists.infradead.org>; Thu, 16 Nov 2017 08:51:30 -0800 (PST)
Subject: Re: UBIFS does not mount after powerfail
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <f84e49bb-a870-c519-6224-cf15dce9ce24@colorfullife.com>
 <4fafb954-2b57-1b7a-cfc9-85d379c0aa57@colorfullife.com>
 <7598033.H8v47AZKNl@blindfold>
From: Manfred Spraul <manfred@colorfullife.com>
Message-ID: <c0730b1f-861b-6c3d-b3aa-77825a5d4470@colorfullife.com>
Date: Thu, 16 Nov 2017 17:51:26 +0100
MIME-Version: 1.0
In-Reply-To: <7598033.H8v47AZKNl@blindfold>
Content-Type: multipart/mixed; boundary="------------6240A8F7CF8AE7CF81314891"
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------6240A8F7CF8AE7CF81314891
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

(2nd mail, forced as non-html)

On 11/15/2017 09:29 PM, Richard Weinberger wrote:
> Manfred,
>
> Am Mittwoch, 15. November 2017, 21:04:14 CET schrieb Manfred Spraul:
>> Hi,
>>
>> On 11/14/2017 07:49 PM, Manfred Spraul wrote:
>>> Hi Richard,
>>>
>>> On 11/13/2017 10:06 PM, Richard Weinberger wrote:
>>>> No, the image that contains the first logical error.
>>>> UBIFS can mount even if there are many problems with the structure.
>>>> Therefore I need you to enable chk_fs.
>>> Done - and I even found a 2nd instance where the image got bad:
>>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/
>> Sorry for the self-reply, I did another test:
>> I applied "ubifs: replay: Detect and kill orphaned xattrs", i.e.
>> https://patchwork.ozlabs.org/patch/780667/.
> I would be astonished if that patch would fix your issues, it is supposed
> to fix a -ENOSPC problem.
After enabling chk_fs, the result was
> UBIFS error (ubi0:0 pid 5104): dbg_check_filesystem: inode 39012 nlink is 1, but calculated nlink is 0
and link count 1 instead of 0 sounded a bit like a leak.

dmesg:
https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/result-168078.txt/download
image:
https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/image-168078.bin/download

Thus I decided that it might make sense to try a patch that should 
improve the behavior with leaks.
And it did not take much time.

>   
>> Finding 1: It does not help
>> Finding 2: I get for some images lots of "UBIFS error (ubi0:0 pid
>> 13670): ubifs_replay_journal: Expected ino node, got: 1/2/3"
> 1/2/3?
Sorry, that was too short:

https://sourceforge.net/projects/calculix-rpm/files/ubifs/kill_xattr/result-168168.txt/download

> [ 1281.127396] ubi0: background thread "ubi_bgt0d" started, PID 9653
> [ 1281.132641] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" 
> started, PID 9660
> [ 1281.132813] UBIFS (ubi0:0): recovery needed
> [ 1281.137769] UBIFS error (ubi0:0 pid 9658): ubifs_replay_journal: 
> Expected ino node, got: 2
> [ 1281.138860] UBIFS error (ubi0:0 pid 9658): ubifs_replay_journal: 
> Expected ino node, got: 3
> [ 1281.139898] UBIFS error (ubi0:0 pid 9658): ubifs_replay_journal: 
> Expected ino node, got: 2
> [ 1281.140922] UBIFS error (ubi0:0 pid 9658): ubifs_replay_journal: 
> Expected ino node, got: 3
> [ 1281.142023] UBIFS error (ubi0:0 pid 9658): ubifs_replay_journal: 
> Expected ino node, got: 1
> [...]

Image:
https://sourceforge.net/projects/calculix-rpm/files/ubifs/kill_xattr/image-168168.bin/download  


> Is always "got 0xFF but expected something different"?
> If so, it can be a problem with garbage collect.
>> The last good image is e.g. 164908, the first image with such messages
>> is 164909:
>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/kill_xattr/
>>
>> And, perhaps it helps to understand the issues:
>> The stress test is parallel, i.e. 4 parallel bash scripts that do
>> something like "touch a b c ;rm c; mv a b;".
> Hmm, nothing fancy. No O_TMPFILE, no xattr, no encryption. :-(
> I hope I'll find some time during the weekend to inspect your images.
I have attached the generator:
With xattr, due to ecryptfs with ecryptfs_xattr_metadata.

Regarding the "expected ino node":
Is it possible that it is caused by parallel operation?

There are 8 threads that do parallel operations, on a 2-core (4 thread) 
Core-I3 system.
What prevents that another thread creates a journal entry between 
initial UBIFS_XENT_KEY and the two UBIFS_INO_KEY?

If you need something, just send me a mail

--
     Manfred

--------------6240A8F7CF8AE7CF81314891
Content-Type: application/x-shellscript;
 name="gen.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="gen.sh"

IyEvYmluL2Jhc2gKCnViaWF0dGFjaCAtcCAvZGV2L210ZDAKbW91bnQgLXQgdWJpZnMgdWJp
MDp2b2wgLi9yb290IC1vIHJ3CmNkIHJvb3QKCm1rZGlyIC1wIC4vcm9vdC9hIC4vcm9vdC9i
CgplY2hvICJibHViIiB8IGVjcnlwdGZzLWFkZC1wYXNzcGhyYXNlIC0KbW91bnQgLWkgLXQg
ZWNyeXB0ZnMgLi9yb290L2EgLi9yb290L2IgLW8gZWNyeXB0ZnNfc2lnPTk1OTgwNThhZjky
NGZmODUsZWNyeXB0ZnNfY2lwaGVyPWFlcyxlY3J5cHRmc19rZXlfYnl0ZXM9MzIsZWNyeXB0
ZnNfeGF0dHJfbWV0YWRhdGEKbWtkaXIgLXAgLi9yb290L2IveHsxLDIsMyw0LDUsNiw3LDh9
CgpjcmVhdGVmbHMoKSB7CgljZCAkMQkKCWk9MDsKCXdoaWxlIFsgJGkgLWxlIDUwIF07ZG8K
CQlqPWBlY2hvICRpIHwgZ2F3ayAnewoJCQkJbT0yMCtpbnQoNDAqcmFuZCgpKQoJCQkJZm9y
IChqPTA7ajxtO2orKykgewoJCQkJCXByaW50ZigiJWQtJXMtJWQudHh0ICIsKCQxKjEzK2oq
MjMpJTk3LCQxLGopOwoJCQkJfQoJCQl9J2AKCQllY2hvICIkaTogY3JlYXRpbmcgJGoiCgkJ
dG91Y2ggJGoKCQlmb3IgayBpbiAkajtkbwoJCQllY2hvICIkay0kai1hYmNkZSIgPj4gJGs7
CgkJCWVjaG8gIiRqLSRrLWFiY2RlIiA+ICRrOwoJCQllY2hvICJ0bXAtJGotJGstYWJjZGUi
ID4gdG1wLSQkLnR4dAoJCQlzeW5jCgkJCW12IHRtcC0kJC50eHQgJGsKCQlkb25lCgkJc3lu
YwoJCXJtIC1mID8zKi50eHQKCQlybSAtZiA/MSoudHh0CgkJc3luYwoJCXJtIC1mID82Ki50
eHQKCQlybSAtZiA/MioudHh0CgkJcm0gLWYgPzkqLnR4dAoJCXJtIC1mID84Ki50eHQKCQlp
PSRbJGkrMV07Cglkb25lOwoJY2QgLi4vLi4KfQoKY2Qgcm9vdAoKY3JlYXRlZmxzIGIveDEm
CmNyZWF0ZWZscyBiL3gyJgpjcmVhdGVmbHMgYi94MyYKY3JlYXRlZmxzIGIveDQmCmNyZWF0
ZWZscyBiL3g1JgpjcmVhdGVmbHMgYi94NiYKY3JlYXRlZmxzIGIveDcmCmNyZWF0ZWZscyBi
L3g4JgoKd2FpdAoKcm1mbHMoKSB7CgljZCAkMQoJcm0gLWYgMyogNyo7CglzeW5jCglybSAt
ZiAyKjsKCXN5bmMKCXJtIC1mIDQqOwoJc3luYwoJY2QgLi4vLi4KfQpybWZscyBiL3gxJgpy
bWZscyBiL3gyJgpybWZscyBiL3gzJgpybWZscyBiL3g0JgpybWZscyBiL3g1JgpybWZscyBi
L3g2JgpybWZscyBiL3g3JgpybWZscyBiL3g4JgoKd2FpdAoKY2QgLi4KCnVtb3VudCAuL3Jv
b3QvYgp1bW91bnQgLi9yb290CnViaWRldGFjaCAvZGV2L3ViaV9jdHJsIC1tIDAKCg==
--------------6240A8F7CF8AE7CF81314891--
