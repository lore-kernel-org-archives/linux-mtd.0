Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yi5WD-0003VY-Kd
 for linux-mtd@lists.infradead.org; Tue, 14 Apr 2015 18:25:06 +0000
Received: by igbpi8 with SMTP id pi8so52354610igb.0
 for <linux-mtd@lists.infradead.org>; Tue, 14 Apr 2015 11:24:43 -0700 (PDT)
MIME-Version: 1.0
Sender: namnguyen@google.com
In-Reply-To: <20150402211550.GJ32500@ld-irv-0074>
References: <1425498091-3505-1-git-send-email-namnguyen@chromium.org>
 <20150402211550.GJ32500@ld-irv-0074>
From: Nam Nguyen <namnguyen@chromium.org>
Date: Tue, 14 Apr 2015 11:24:23 -0700
Message-ID: <CA+YNSmVCefLY0Stb1VNxbvZxGE2iuw9X_5Ts1rb3cAx_yNZ3Ag@mail.gmail.com>
Subject: Re: [PATCH v3] mtd-utils: Add mtdpart to add/delete partition
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mike Frysinger <vapier@chromium.org>, linux-mtd@lists.infradead.org,
 dehrenberg@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 2, 2015 at 2:15 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> This doesn't even compile...

This is an embarrassment. I'm so sorry it happened.

>
> On Wed, Mar 04, 2015 at 11:41:31AM -0800, Nam T. Nguyen wrote:
>> Add a simple utility to exercise BLKPG ioctl.
>>
>> Signed-off-by: Nam T. Nguyen <namnguyen@chromium.org>
>> ---
>> Changes from v2:
>>
>>   o Fix coding style
>>   o Remove cleanup code since we exit()ing anyway.
>>
>>  Makefile  |   2 +-
>>  mtdpart.c | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 188 insertions(+), 1 deletion(-)
>>  create mode 100644 mtdpart.c
>>
> ...
>> diff --git a/mtdpart.c b/mtdpart.c
>> new file mode 100644
>> index 0000000..b944f49
>> --- /dev/null
>> +++ b/mtdpart.c
>> @@ -0,0 +1,187 @@
> [...]
>> +             command = COMMAND_DEL;
>> +     } else if (strcmp(s_command, "add") == 0 && (argc - optind) == 3) {
>> +             part_name = argv[optind++];
>> +             const char *s_start = argv[optind++];
>> +             const char *s_length = argv[optind++];
>
> The preferred style is to keep variable definitions before statements.

Done in v4.

>
>> +
>> +             if (strlen(part_name) >= BLKPG_DEVNAMELTH)
>> +                     errmsg_die("Partition name (%s) should be less than %d characters"
>
> ^^ you're missing a comma on this line. I think that's the only compile
> issue? But I'd expect you to compile and test what you're sending
> first...

Thanks for catching it. Version 4 fixed this.

Nam
