Subject: Re: linux-next: Tree for Dec 15 (fs/ubifs/ causes problems in
 fs/crypto/)
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
References: <20161215142108.0ec084b0@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a29553a3-c355-43ed-7d50-3aeb7eb8b3b1@infradead.org>
Date: Thu, 15 Dec 2016 10:13:21 -0800
MIME-Version: 1.0
In-Reply-To: <20161215142108.0ec084b0@canb.auug.org.au>
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

On 12/14/16 19:21, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material for v4.11 to your linux-next included
> branches until after v4.10-rc1 has been released.
> 
> Changes since 20161214:
> 

on x86_64:

when CONFIG_BLOCK is not enabled:

warning: (UBIFS_FS_ENCRYPTION) selects FS_ENCRYPTION which has unmet direct dependencies (BLOCK)

../fs/crypto/crypto.c: In function 'fscrypt_zeroout_range':
../fs/crypto/crypto.c:355:3: error: implicit declaration of function 'bio_alloc' [-Werror=implicit-function-declaration]
   bio = bio_alloc(GFP_NOWAIT, 1);
   ^
../fs/crypto/crypto.c:355:7: warning: assignment makes pointer from integer without a cast [enabled by default]
   bio = bio_alloc(GFP_NOWAIT, 1);
       ^
../fs/crypto/crypto.c:360:6: error: dereferencing pointer to incomplete type
   bio->bi_bdev = inode->i_sb->s_bdev;
      ^
../fs/crypto/crypto.c:361:6: error: dereferencing pointer to incomplete type
   bio->bi_iter.bi_sector =
      ^
../fs/crypto/crypto.c:363:3: error: implicit declaration of function 'bio_set_op_attrs' [-Werror=implicit-function-declaration]
   bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
   ^
../fs/crypto/crypto.c:363:25: error: 'REQ_OP_WRITE' undeclared (first use in this function)
   bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
                         ^
../fs/crypto/crypto.c:363:25: note: each undeclared identifier is reported only once for each function it appears in
../fs/crypto/crypto.c:364:3: error: implicit declaration of function 'bio_add_page' [-Werror=implicit-function-declaration]
   ret = bio_add_page(bio, ciphertext_page,
   ^
../fs/crypto/crypto.c:369:4: error: implicit declaration of function 'bio_put' [-Werror=implicit-function-declaration]
    bio_put(bio);
    ^
../fs/crypto/crypto.c:373:3: error: implicit declaration of function 'submit_bio_wait' [-Werror=implicit-function-declaration]
   err = submit_bio_wait(bio);
   ^
../fs/crypto/crypto.c:374:24: error: dereferencing pointer to incomplete type
   if ((err == 0) && bio->bi_error)
                        ^
../fs/crypto/crypto.c: In function 'completion_pages':
../fs/crypto/crypto.c:457:2: error: implicit declaration of function 'bio_for_each_segment_all' [-Werror=implicit-function-declaration]
  bio_for_each_segment_all(bv, bio, i) {
  ^
../fs/crypto/crypto.c:457:39: error: expected ';' before '{' token
  bio_for_each_segment_all(bv, bio, i) {
                                       ^
cc1: some warnings being treated as errors



-- 
~Randy
