Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEmes-0002DN-7D
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 06:07:19 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: jamesm@redhat.com
Content-Type: text/plain
Date: Fri, 25 Mar 2005 14:06:47 +0300
Message-Id: <1111748807.4566.16.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Crypto API extention request
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello James,

I'm an JFFS2/JFFS3 developer and I'm working on cleaning-up the JFFS3
compression stuff. JFFS3 contains a number of compressors which actually
shouldn't be there as they are platform-independent and generic. So we
want to move them to the generic part of the Linux kernel instead of
storing them in fs/jffs2/. And we were going to use CryptoAPI to access
the compressors.

But I've hit on a problem - CryptoAPI's compression method is too poor
for us.

CryptoAPI's compress method is:

int crypto_compress(struct crypto_tfm *tfm,
                    const u8 *src, unsigned int slen,
                    u8 *dst, unsigned int *dlen);

*src - input data;
slen - input data length;
*dst - output data;
*dlen - on input - output buffer length, on output - the length of the
compressed data;

The crypto_compress() API call either compresses all the input data or
returns error.

In JFFS2 we need something more flexible. Te following is what we want:

int crypto_compress_ext(struct crypto_tfm *tfm,
                    const u8 *src, unsigned int *slen,
                    u8 **dst, unsigned int *dlen);

*src - input data;
*slen - on input - input data length, on output - the amount of data
that were actually compressed.
*dst - output data;
*dlen - on input - output buffer length, on output - the length of the
compressed data;

This would allow us (and we really need this) to provide a large input
data buffer, a small output data buffer and to ask the compressor to
compress as much input data as it can to fit to the output buffer. To
put it differently, we often have a large input, and several small
output buffers, and we want to compress the input data to them.

I offer to extend the CryptoAPI and add an "extended compress" API call
with the above mentioned capabilities. We might as well just change the
crypto_compress() and all its users.

What do you think?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
