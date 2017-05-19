Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWqJ-0007Bq-Np
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:36:49 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 15/29] siphash.txt: standardize document format
Date: Thu, 18 May 2017 22:25:59 -0300
Message-Id: <c7aaa7fa31af17a41627d11232e2d7ad53417dd8.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Mark titles;
- Mark literal blocks;
- Use :Author: for authorship;
- Don't sumerate chapters;
- Adjust identation.

NOTE:

This file has actually two documents inside it, the first
one describing siphash, the second one describing halfsiphash.

It is likely a good idea to split them when it gets moved to
security/ (which is where it probably belongs).

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/siphash.txt | 186 +++++++++++++++++++++++++---------------------
 1 file changed, 100 insertions(+), 86 deletions(-)

diff --git a/Documentation/siphash.txt b/Documentation/siphash.txt
index 908d348ff777..9965821ab333 100644
--- a/Documentation/siphash.txt
+++ b/Documentation/siphash.txt
@@ -1,6 +1,8 @@
-         SipHash - a short input PRF
------------------------------------------------
-Written by Jason A. Donenfeld <jason@zx2c4.com>
+===========================
+SipHash - a short input PRF
+===========================
+
+:Author: Written by Jason A. Donenfeld <jason@zx2c4.com>
 
 SipHash is a cryptographically secure PRF -- a keyed hash function -- that
 performs very well for short inputs, hence the name. It was designed by
@@ -13,58 +15,61 @@ an input buffer or several input integers. It spits out an integer that is
 indistinguishable from random. You may then use that integer as part of secure
 sequence numbers, secure cookies, or mask it off for use in a hash table.
 
-1. Generating a key
+Generating a key
+================
 
 Keys should always be generated from a cryptographically secure source of
-random numbers, either using get_random_bytes or get_random_once:
+random numbers, either using get_random_bytes or get_random_once::
 
-siphash_key_t key;
-get_random_bytes(&key, sizeof(key));
-
-If you're not deriving your key from here, you're doing it wrong.
-
-2. Using the functions
-
-There are two variants of the function, one that takes a list of integers, and
-one that takes a buffer:
-
-u64 siphash(const void *data, size_t len, const siphash_key_t *key);
-
-And:
-
-u64 siphash_1u64(u64, const siphash_key_t *key);
-u64 siphash_2u64(u64, u64, const siphash_key_t *key);
-u64 siphash_3u64(u64, u64, u64, const siphash_key_t *key);
-u64 siphash_4u64(u64, u64, u64, u64, const siphash_key_t *key);
-u64 siphash_1u32(u32, const siphash_key_t *key);
-u64 siphash_2u32(u32, u32, const siphash_key_t *key);
-u64 siphash_3u32(u32, u32, u32, const siphash_key_t *key);
-u64 siphash_4u32(u32, u32, u32, u32, const siphash_key_t *key);
-
-If you pass the generic siphash function something of a constant length, it
-will constant fold at compile-time and automatically choose one of the
-optimized functions.
-
-3. Hashtable key function usage:
-
-struct some_hashtable {
-	DECLARE_HASHTABLE(hashtable, 8);
 	siphash_key_t key;
-};
+	get_random_bytes(&key, sizeof(key));
 
-void init_hashtable(struct some_hashtable *table)
-{
-	get_random_bytes(&table->key, sizeof(table->key));
-}
+If you're not deriving your key from here, you're doing it wrong.
 
-static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
-{
-	return &table->hashtable[siphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
-}
+Using the functions
+===================
+
+There are two variants of the function, one that takes a list of integers, and
+one that takes a buffer::
+
+	u64 siphash(const void *data, size_t len, const siphash_key_t *key);
+
+And::
+
+	u64 siphash_1u64(u64, const siphash_key_t *key);
+	u64 siphash_2u64(u64, u64, const siphash_key_t *key);
+	u64 siphash_3u64(u64, u64, u64, const siphash_key_t *key);
+	u64 siphash_4u64(u64, u64, u64, u64, const siphash_key_t *key);
+	u64 siphash_1u32(u32, const siphash_key_t *key);
+	u64 siphash_2u32(u32, u32, const siphash_key_t *key);
+	u64 siphash_3u32(u32, u32, u32, const siphash_key_t *key);
+	u64 siphash_4u32(u32, u32, u32, u32, const siphash_key_t *key);
+
+If you pass the generic siphash function something of a constant length, it
+will constant fold at compile-time and automatically choose one of the
+optimized functions.
+
+Hashtable key function usage::
+
+	struct some_hashtable {
+		DECLARE_HASHTABLE(hashtable, 8);
+		siphash_key_t key;
+	};
+
+	void init_hashtable(struct some_hashtable *table)
+	{
+		get_random_bytes(&table->key, sizeof(table->key));
+	}
+
+	static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
+	{
+		return &table->hashtable[siphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
+	}
 
 You may then iterate like usual over the returned hash bucket.
 
-4. Security
+Security
+========
 
 SipHash has a very high security margin, with its 128-bit key. So long as the
 key is kept secret, it is impossible for an attacker to guess the outputs of
@@ -73,7 +78,8 @@ is significant.
 
 Linux implements the "2-4" variant of SipHash.
 
-5. Struct-passing Pitfalls
+Struct-passing Pitfalls
+=======================
 
 Often times the XuY functions will not be large enough, and instead you'll
 want to pass a pre-filled struct to siphash. When doing this, it's important
@@ -81,30 +87,32 @@ to always ensure the struct has no padding holes. The easiest way to do this
 is to simply arrange the members of the struct in descending order of size,
 and to use offsetendof() instead of sizeof() for getting the size. For
 performance reasons, if possible, it's probably a good thing to align the
-struct to the right boundary. Here's an example:
+struct to the right boundary. Here's an example::
 
-const struct {
-	struct in6_addr saddr;
-	u32 counter;
-	u16 dport;
-} __aligned(SIPHASH_ALIGNMENT) combined = {
-	.saddr = *(struct in6_addr *)saddr,
-	.counter = counter,
-	.dport = dport
-};
-u64 h = siphash(&combined, offsetofend(typeof(combined), dport), &secret);
+	const struct {
+		struct in6_addr saddr;
+		u32 counter;
+		u16 dport;
+	} __aligned(SIPHASH_ALIGNMENT) combined = {
+		.saddr = *(struct in6_addr *)saddr,
+		.counter = counter,
+		.dport = dport
+	};
+	u64 h = siphash(&combined, offsetofend(typeof(combined), dport), &secret);
 
-6. Resources
+Resources
+=========
 
 Read the SipHash paper if you're interested in learning more:
 https://131002.net/siphash/siphash.pdf
 
+-------------------------------------------------------------------------------
 
-~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~
-
+===============================================
 HalfSipHash - SipHash's insecure younger cousin
------------------------------------------------
-Written by Jason A. Donenfeld <jason@zx2c4.com>
+===============================================
+
+:Author: Written by Jason A. Donenfeld <jason@zx2c4.com>
 
 On the off-chance that SipHash is not fast enough for your needs, you might be
 able to justify using HalfSipHash, a terrifying but potentially useful
@@ -120,7 +128,8 @@ then when you can be absolutely certain that the outputs will never be
 transmitted out of the kernel. This is only remotely useful over `jhash` as a
 means of mitigating hashtable flooding denial of service attacks.
 
-1. Generating a key
+Generating a key
+================
 
 Keys should always be generated from a cryptographically secure source of
 random numbers, either using get_random_bytes or get_random_once:
@@ -130,44 +139,49 @@ get_random_bytes(&key, sizeof(key));
 
 If you're not deriving your key from here, you're doing it wrong.
 
-2. Using the functions
+Using the functions
+===================
 
 There are two variants of the function, one that takes a list of integers, and
-one that takes a buffer:
+one that takes a buffer::
 
-u32 hsiphash(const void *data, size_t len, const hsiphash_key_t *key);
+	u32 hsiphash(const void *data, size_t len, const hsiphash_key_t *key);
 
-And:
+And::
 
-u32 hsiphash_1u32(u32, const hsiphash_key_t *key);
-u32 hsiphash_2u32(u32, u32, const hsiphash_key_t *key);
-u32 hsiphash_3u32(u32, u32, u32, const hsiphash_key_t *key);
-u32 hsiphash_4u32(u32, u32, u32, u32, const hsiphash_key_t *key);
+	u32 hsiphash_1u32(u32, const hsiphash_key_t *key);
+	u32 hsiphash_2u32(u32, u32, const hsiphash_key_t *key);
+	u32 hsiphash_3u32(u32, u32, u32, const hsiphash_key_t *key);
+	u32 hsiphash_4u32(u32, u32, u32, u32, const hsiphash_key_t *key);
 
 If you pass the generic hsiphash function something of a constant length, it
 will constant fold at compile-time and automatically choose one of the
 optimized functions.
 
-3. Hashtable key function usage:
+Hashtable key function usage
+============================
 
-struct some_hashtable {
-	DECLARE_HASHTABLE(hashtable, 8);
-	hsiphash_key_t key;
-};
+::
 
-void init_hashtable(struct some_hashtable *table)
-{
-	get_random_bytes(&table->key, sizeof(table->key));
-}
+	struct some_hashtable {
+		DECLARE_HASHTABLE(hashtable, 8);
+		hsiphash_key_t key;
+	};
 
-static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
-{
-	return &table->hashtable[hsiphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
-}
+	void init_hashtable(struct some_hashtable *table)
+	{
+		get_random_bytes(&table->key, sizeof(table->key));
+	}
+
+	static inline hlist_head *some_hashtable_bucket(struct some_hashtable *table, struct interesting_input *input)
+	{
+		return &table->hashtable[hsiphash(input, sizeof(*input), &table->key) & (HASH_SIZE(table->hashtable) - 1)];
+	}
 
 You may then iterate like usual over the returned hash bucket.
 
-4. Performance
+Performance
+===========
 
 HalfSipHash is roughly 3 times slower than JenkinsHash. For many replacements,
 this will not be a problem, as the hashtable lookup isn't the bottleneck. And
-- 
2.9.4
