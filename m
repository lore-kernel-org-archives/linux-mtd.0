Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dmI60-00060K-Lb
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 11:20:46 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH mtd-utils] nandmarkbad: new util to mark blocks as bad
To: linux-mtd@lists.infradead.org
References: <20170824152227.30394-1-ukleinek@debian.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <ukleinek@debian.org>
Message-ID: <3259e990-8b1f-8c30-17a0-e6bc023cd6f7@sigma-star.at>
Date: Mon, 28 Aug 2017 13:20:19 +0200
MIME-Version: 1.0
In-Reply-To: <20170824152227.30394-1-ukleinek@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


On 08/24/2017 05:22 PM, Uwe Kleine-König wrote:
> +void usage(int status)
> +{
> +	fprintf(status ? stderr : stdout,
> +		"usage: %s [OPTIONS] <device>\n\n"
> +		"  -b, --markbad=blockno        Mark block bad\n"
> +		PROGRAM_NAME);
I assume there's a comma missing? Running the program without
arguments segfaults immediately on my system.


> +	exit(status);
> +}
> +
> +/*
> + * Main program
> + */
> +int main(int argc, char **argv)
> +{
> +	loff_t mark_bad[32];
> +	unsigned cnt_bad = 0;
> +	struct mtd_dev_info mtd;
> +	libmtd_t mtd_desc;
> +	int fd;
> +	int error = 0;
> +	int ret;
> +	unsigned int i;
> +
> +	for (;;) {
> +		static const char short_options[] = "b:h";
> +		static const struct option long_options[] = {
> +			{ "markbad", required_argument, 0, 'b' },
> +			{0, 0, 0, 0},
> +		};
> +		int option_index = 0;
> +		int c = getopt_long(argc, argv, short_options, long_options,
> +				    &option_index);
> +		if (c == EOF)
> +			break;

A "--help" long option in addition to the "-h" short option would be nice.
And additionally a "--version" long option with a "-V" short option.

There is a helper function called "common_print_version" that basically prints
'PROGRAM_NAME (mtd-utils) PACKAGE_VERSION'.


Thanks,

David
