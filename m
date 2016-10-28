Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c0AdH-0001rD-Pj
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 17:07:57 +0000
Subject: Re: [PATCH] ubifs: Fix regression in ubifs_readdir()
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 linux-mtd@lists.infradead.org
References: <1477648432-9543-1-git-send-email-richard@nod.at>
 <1477671544.8927.1.camel@embedded.rocks>
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, adrian.hunter@intel.com, ralph.sennhauser@gmail.com,
 peda@axentia.se
From: Richard Weinberger <richard@nod.at>
Message-ID: <c542e099-0404-be8e-ebeb-d4265d3204d6@nod.at>
Date: Fri, 28 Oct 2016 19:07:26 +0200
MIME-Version: 1.0
In-Reply-To: <1477671544.8927.1.camel@embedded.rocks>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörg,

On 28.10.2016 18:19, Jörg Krause wrote:
> Hi,
> 
> On Fri, 2016-10-28 at 11:53 +0200, Richard Weinberger wrote:
>> Commit c83ed4c9dbb35 ("ubifs: Abort readdir upon error") broke
>> overlayfs support because the fix exposed an internal error
>> code to VFS.
>>
>> Reported-by: Peter Rosin <peda@axentia.se>
>> Tested-by: Peter Rosin <peda@axentia.se>
>> Reported-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
>> Fixes: c83ed4c9dbb35 ("ubifs: Abort readdir upon error")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  fs/ubifs/dir.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>> index bd4a5e8ce441..ca16c5d7bab1 100644
>> --- a/fs/ubifs/dir.c
>> +++ b/fs/ubifs/dir.c
>> @@ -543,6 +543,14 @@ static int ubifs_readdir(struct file *file,
>> struct dir_context *ctx)
>>  
>>  	if (err != -ENOENT)
>>  		ubifs_err(c, "cannot find next direntry, error %d",
>> err);
>> +	else
>> +		/*
>> +		 * -ENOENT is a non-fatal error in this context, the
>> TNC uses
>> +		 * it to indicate that the cursor moved past the
>> current directory
>> +		 * and readdir() has to stop.
>> +		 */
>> +		err = 0;
>> +
>>  
>>  	/* 2 is a special value indicating that there are no more
>> direntries */
>>  	ctx->pos = 2;
> 
> I'm not sure if it's related to the issue reported by Peter Rosin and
> Ralph Sennhauser, but I am still getting a kernel panic using UBIFS
> with OverlayFS on Linux v4.9.0-rc2 with this patch applied:

Does reverting c83ed4c9dbb35 help?
And are you 100% sure you applied the fix?

Does the following WARN_ON() trigger?
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ca16c5d7bab1..12ffc91f7ef8 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -554,6 +554,9 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)

 	/* 2 is a special value indicating that there are no more direntries */
 	ctx->pos = 2;
+
+	WARN_ON(err);
+
 	return err;
 }


Thanks,
//richard
