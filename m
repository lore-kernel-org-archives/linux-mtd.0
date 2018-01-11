Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZRxj-0006ih-Eh
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 01:47:25 +0000
Received: by mail-yb0-x244.google.com with SMTP id h189so420767ybc.11
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jan 2018 17:47:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3873582.N8pb6r5EOO@blindfold>
References: <1515578741-6612-1-git-send-email-rockdotlee@gmail.com>
 <3873582.N8pb6r5EOO@blindfold>
From: Rock Lee <rockdotlee@gmail.com>
Date: Thu, 11 Jan 2018 09:47:11 +0800
Message-ID: <CAL-1w2vN46pakvAA+mOj+YNiSnh1PWgwwrWSA305X3+SHNwnUQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Change log level in ubifs_xattr_get
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 adrian.hunter@intel.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Just print warning message when xattr value size is bigger than the
>> buffer size. There is a situation that other modules, like overlayfs,
>> try to get xattr value with a small buffer, if they get -ERANGE, they
>> will try again with the proper buffer size. No need to report a error
>> message, warning message is enough.
>>
>> Signed-off-by: Rock Lee <rockdotlee@gmail.com>
>> ---
>>  fs/ubifs/xattr.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
>> index 5ddc89d..bc20530 100644
>> --- a/fs/ubifs/xattr.c
>> +++ b/fs/ubifs/xattr.c
>> @@ -381,7 +381,7 @@ ssize_t ubifs_xattr_get(struct inode *host, const char
>> *name, void *buf, if (buf) {
>>               /* If @buf is %NULL we are supposed to return the length */
>>               if (ui->data_len > size) {
>> -                     ubifs_err(c, "buffer size %zd, xattr len %d",
>> +                     ubifs_warn(c, "buffer size %zd, xattr len %d",
>>                                 size, ui->data_len);
>
> Hmm, if this can be triggered that easy I suggest getting completely rid of
> this message.
>

OK, forget about this one, I am going to send you another patch to get
rid of this message


-- 
Cheers,
Rock
