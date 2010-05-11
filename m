Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OBgQC-0002l7-14
	for linux-mtd@lists.infradead.org; Tue, 11 May 2010 03:46:20 +0000
Received: by wyj26 with SMTP id 26so1135434wyj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 May 2010 20:46:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <i2sa145ef951005032020i17584946r95957f8a038efe23@mail.gmail.com>
References: <a145ef951003110433k5fd6c3c0h23bbe73fdb39686f@mail.gmail.com>
	<531B6536C9F737458807DF75064873C8BE5EB0382D@mta-digimail.MTA.INT>
	<a145ef951003160113x7baea205i8deb13c14ba8e0de@mail.gmail.com>
	<1270544458.6754.15.camel@localhost>
	<r2va145ef951005030454ud5400ebao9ce886d0e86c7549@mail.gmail.com>
	<1272888512.27729.46.camel@localhost>
	<i2sa145ef951005032020i17584946r95957f8a038efe23@mail.gmail.com>
Date: Tue, 11 May 2010 11:46:13 +0800
Message-ID: <AANLkTil-IPNGJdudKOjtHjc9Y2od0xM2-D7beVEV_HHI@mail.gmail.com>
Subject: Re: Can not mount UBIFS
From: =?Big5?B?qkykX65t?= <okpalin@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Bosi Daniele <Daniele.Bosi@mta.it>,
	GUIDA Nicola <Nicola.GUIDA@numonyx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I have modified bootloader to download image as ubiformat does.
However, I still can not mount it.
I also dump the content of mtd partition and compare.
(Ex: dd if=3D/dev/block/mtdblock5 of=3D/data/mtd5bak)
No difference between the content written by bootloader and written by
ubiformat.

The following is the debug messages:

<7>UBI DBG (pid 732): ctrl_cdev_ioctl: attach MTD device
<5>UBI: attaching mtd5 to ubi0
<7>UBI DBG (pid 732): io_init: min_io_size      2048
<7>UBI DBG (pid 732): io_init: hdrs_min_io_size 2048
<7>UBI DBG (pid 732): io_init: ec_hdr_alsize    2048
<7>UBI DBG (pid 732): io_init: vid_hdr_alsize   2048
<7>UBI DBG (pid 732): io_init: vid_hdr_offset   2048
<7>UBI DBG (pid 732): io_init: vid_hdr_aloffset 2048
<7>UBI DBG (pid 732): io_init: vid_hdr_shift    0
<7>UBI DBG (pid 732): io_init: leb_start        4096
<7>UBI DBG (pid 732): io_init: max_erroneous    51
<5>UBI: physical eraseblock size:   131072 bytes (128 KiB)
<5>UBI: logical eraseblock size:    126976 bytes
<5>UBI: smallest flash I/O unit:    2048
<5>UBI: VID header offset:          2048 (aligned 2048)
<5>UBI: data offset:                4096
<7>UBI DBG (pid 732): ubi_scan: process PEB 0
<7>UBI DBG (pid 732): ubi_scan: process PEB 1
<7>UBI DBG (pid 732): ubi_scan: process PEB 2
<7>UBI DBG (pid 732): ubi_scan: process PEB 3
<7>UBI DBG (pid 732): ubi_scan: process PEB 4
<7>UBI DBG (pid 732): ubi_scan: process PEB 5
<7>UBI DBG (pid 732): ubi_scan: process PEB 6
<7>UBI DBG (pid 732): ubi_scan: process PEB 7
<7>UBI DBG (pid 732): ubi_scan: process PEB 8
<7>UBI DBG (pid 732): ubi_scan: process PEB 9
<7>UBI DBG (pid 732): ubi_scan: process PEB 10
<7>UBI DBG (pid 732): ubi_scan: process PEB 11
<7>UBI DBG (pid 732): ubi_scan: process PEB 12
<7>UBI DBG (pid 732): ubi_scan: process PEB 13
<7>UBI DBG (pid 732): ubi_scan: process PEB 14
<7>UBI DBG (pid 732): ubi_scan: process PEB 15
<7>UBI DBG (pid 732): ubi_scan: process PEB 16
<7>UBI DBG (pid 732): ubi_scan: process PEB 17
<7>UBI DBG (pid 732): ubi_scan: process PEB 18
<7>UBI DBG (pid 732): ubi_scan: process PEB 19
<7>UBI DBG (pid 732): ubi_scan: process PEB 20
<7>UBI DBG (pid 732): ubi_scan: process PEB 21
<7>UBI DBG (pid 732): ubi_scan: process PEB 22
<7>UBI DBG (pid 732): ubi_scan: process PEB 23
<7>UBI DBG (pid 732): ubi_scan: process PEB 24
<7>UBI DBG (pid 732): ubi_scan: process PEB 25
<7>UBI DBG (pid 732): ubi_scan: process PEB 26
<7>UBI DBG (pid 732): ubi_scan: process PEB 27
<7>UBI DBG (pid 732): ubi_scan: process PEB 28
<7>UBI DBG (pid 732): ubi_scan: process PEB 29
<7>UBI DBG (pid 732): ubi_scan: process PEB 30
<7>UBI DBG (pid 732): ubi_scan: process PEB 31
<7>UBI DBG (pid 732): ubi_scan: process PEB 32
<7>UBI DBG (pid 732): ubi_scan: process PEB 33
<7>UBI DBG (pid 732): ubi_scan: process PEB 34
<7>UBI DBG (pid 732): ubi_scan: process PEB 35
<7>UBI DBG (pid 732): ubi_scan: process PEB 36
<7>UBI DBG (pid 732): ubi_scan: process PEB 37
<7>UBI DBG (pid 732): ubi_scan: process PEB 38
<7>UBI DBG (pid 732): ubi_scan: process PEB 39
<7>UBI DBG (pid 732): ubi_scan: process PEB 40
<7>UBI DBG (pid 732): ubi_scan: process PEB 41
<7>UBI DBG (pid 732): ubi_scan: process PEB 42
<7>UBI DBG (pid 732): ubi_scan: process PEB 43
<7>UBI DBG (pid 732): ubi_scan: process PEB 44
<7>UBI DBG (pid 732): ubi_scan: process PEB 45
<7>UBI DBG (pid 732): ubi_scan: process PEB 46
<7>UBI DBG (pid 732): ubi_scan: process PEB 47
<7>UBI DBG (pid 732): ubi_scan: process PEB 48
<7>UBI DBG (pid 732): ubi_scan: process PEB 49
<7>UBI DBG (pid 732): ubi_scan: process PEB 50
<7>UBI DBG (pid 732): ubi_scan: process PEB 51
<7>UBI DBG (pid 732): ubi_scan: process PEB 52
<7>UBI DBG (pid 732): ubi_scan: process PEB 53
<7>UBI DBG (pid 732): ubi_scan: process PEB 54
<7>UBI DBG (pid 732): ubi_scan: process PEB 55
<7>UBI DBG (pid 732): ubi_scan: process PEB 56
<7>UBI DBG (pid 732): ubi_scan: process PEB 57
<7>UBI DBG (pid 732): ubi_scan: process PEB 58
<7>UBI DBG (pid 732): ubi_scan: process PEB 59
<7>UBI DBG (pid 732): ubi_scan: process PEB 60
<7>UBI DBG (pid 732): ubi_scan: process PEB 61
<7>UBI DBG (pid 732): ubi_scan: process PEB 62
<7>UBI DBG (pid 732): ubi_scan: process PEB 63
<7>UBI DBG (pid 732): ubi_scan: process PEB 64
<7>UBI DBG (pid 732): ubi_scan: process PEB 65
<6>Block 2540 is factory bad in chip 0, offset =3D 13d80000
<7>UBI DBG (pid 732): ubi_scan: process PEB 66
<6>Block 2541 is factory bad in chip 0, offset =3D 13da0000
<7>UBI DBG (pid 732): ubi_scan: process PEB 67
<7>UBI DBG (pid 732): ubi_scan: process PEB 68
<7>UBI DBG (pid 732): ubi_scan: process PEB 69
<7>UBI DBG (pid 732): ubi_scan: process PEB 70
<7>UBI DBG (pid 732): ubi_scan: process PEB 71
<7>UBI DBG (pid 732): ubi_scan: process PEB 72
<7>UBI DBG (pid 732): ubi_scan: process PEB 73
<7>UBI DBG (pid 732): ubi_scan: process PEB 74
<7>UBI DBG (pid 732): ubi_scan: process PEB 75
<7>UBI DBG (pid 732): ubi_scan: process PEB 76
<7>UBI DBG (pid 732): ubi_scan: process PEB 77
<7>UBI DBG (pid 732): ubi_scan: process PEB 78
<7>UBI DBG (pid 732): ubi_scan: process PEB 79
<7>UBI DBG (pid 732): ubi_scan: process PEB 80
<7>UBI DBG (pid 732): ubi_scan: process PEB 81
<7>UBI DBG (pid 732): ubi_scan: process PEB 82
<7>UBI DBG (pid 732): ubi_scan: process PEB 83
<7>UBI DBG (pid 732): ubi_scan: process PEB 84
<7>UBI DBG (pid 732): ubi_scan: process PEB 85
<7>UBI DBG (pid 732): ubi_scan: process PEB 86
<7>UBI DBG (pid 732): ubi_scan: process PEB 87
<7>UBI DBG (pid 732): ubi_scan: process PEB 88
<7>UBI DBG (pid 732): ubi_scan: process PEB 89
<7>UBI DBG (pid 732): ubi_scan: process PEB 90
<7>UBI DBG (pid 732): ubi_scan: process PEB 91
<7>UBI DBG (pid 732): ubi_scan: process PEB 92
<7>UBI DBG (pid 732): ubi_scan: process PEB 93
<7>UBI DBG (pid 732): ubi_scan: process PEB 94
<7>UBI DBG (pid 732): ubi_scan: process PEB 95
<7>UBI DBG (pid 732): ubi_scan: process PEB 96
<7>UBI DBG (pid 732): ubi_scan: process PEB 97
<7>UBI DBG (pid 732): ubi_scan: process PEB 98
<7>UBI DBG (pid 732): ubi_scan: process PEB 99
<7>UBI DBG (pid 732): ubi_scan: process PEB 100
<7>UBI DBG (pid 732): ubi_scan: process PEB 101
<7>UBI DBG (pid 732): ubi_scan: process PEB 102
<7>UBI DBG (pid 732): ubi_scan: process PEB 103
<7>UBI DBG (pid 732): ubi_scan: process PEB 104
<7>UBI DBG (pid 732): ubi_scan: process PEB 105
<7>UBI DBG (pid 732): ubi_scan: process PEB 106
<7>UBI DBG (pid 732): ubi_scan: process PEB 107
<7>UBI DBG (pid 732): ubi_scan: process PEB 108
<7>UBI DBG (pid 732): ubi_scan: process PEB 109
<7>UBI DBG (pid 732): ubi_scan: process PEB 110
<7>UBI DBG (pid 732): ubi_scan: process PEB 111
<7>UBI DBG (pid 732): ubi_scan: process PEB 112
<7>UBI DBG (pid 732): ubi_scan: process PEB 113
<7>UBI DBG (pid 732): ubi_scan: process PEB 114
<7>UBI DBG (pid 732): ubi_scan: process PEB 115
<7>UBI DBG (pid 732): ubi_scan: process PEB 116
<7>UBI DBG (pid 732): ubi_scan: process PEB 117
<7>UBI DBG (pid 732): ubi_scan: process PEB 118
<7>UBI DBG (pid 732): ubi_scan: process PEB 119
<7>UBI DBG (pid 732): ubi_scan: process PEB 120
<7>UBI DBG (pid 732): ubi_scan: process PEB 121
<7>UBI DBG (pid 732): ubi_scan: process PEB 122
<7>UBI DBG (pid 732): ubi_scan: process PEB 123
<7>UBI DBG (pid 732): ubi_scan: process PEB 124
<7>UBI DBG (pid 732): ubi_scan: process PEB 125
<7>UBI DBG (pid 732): ubi_scan: process PEB 126
<7>UBI DBG (pid 732): ubi_scan: process PEB 127
<7>UBI DBG (pid 732): ubi_scan: process PEB 128
<7>UBI DBG (pid 732): ubi_scan: process PEB 129
<7>UBI DBG (pid 732): ubi_scan: process PEB 130
<7>UBI DBG (pid 732): ubi_scan: process PEB 131
<7>UBI DBG (pid 732): ubi_scan: process PEB 132
<7>UBI DBG (pid 732): ubi_scan: process PEB 133
<7>UBI DBG (pid 732): ubi_scan: process PEB 134
<7>UBI DBG (pid 732): ubi_scan: process PEB 135
<7>UBI DBG (pid 732): ubi_scan: process PEB 136
<7>UBI DBG (pid 732): ubi_scan: process PEB 137
<7>UBI DBG (pid 732): ubi_scan: process PEB 138
<7>UBI DBG (pid 732): ubi_scan: process PEB 139
<7>UBI DBG (pid 732): ubi_scan: process PEB 140
<7>UBI DBG (pid 732): ubi_scan: process PEB 141
<7>UBI DBG (pid 732): ubi_scan: process PEB 142
<7>UBI DBG (pid 732): ubi_scan: process PEB 143
<7>UBI DBG (pid 732): ubi_scan: process PEB 144
<7>UBI DBG (pid 732): ubi_scan: process PEB 145
<7>UBI DBG (pid 732): ubi_scan: process PEB 146
<7>UBI DBG (pid 732): ubi_scan: process PEB 147
<7>UBI DBG (pid 732): ubi_scan: process PEB 148
<7>UBI DBG (pid 732): ubi_scan: process PEB 149
<7>UBI DBG (pid 732): ubi_scan: process PEB 150
<7>UBI DBG (pid 732): ubi_scan: process PEB 151
<7>UBI DBG (pid 732): ubi_scan: process PEB 152
<7>UBI DBG (pid 732): ubi_scan: process PEB 153
<7>UBI DBG (pid 732): ubi_scan: process PEB 154
<7>UBI DBG (pid 732): ubi_scan: process PEB 155
<7>UBI DBG (pid 732): ubi_scan: process PEB 156
<7>UBI DBG (pid 732): ubi_scan: process PEB 157
<7>UBI DBG (pid 732): ubi_scan: process PEB 158
<7>UBI DBG (pid 732): ubi_scan: process PEB 159
<7>UBI DBG (pid 732): ubi_scan: process PEB 160
<7>UBI DBG (pid 732): ubi_scan: process PEB 161
<7>UBI DBG (pid 732): ubi_scan: process PEB 162
<7>UBI DBG (pid 732): ubi_scan: process PEB 163
<7>UBI DBG (pid 732): ubi_scan: process PEB 164
<7>UBI DBG (pid 732): ubi_scan: process PEB 165
<7>UBI DBG (pid 732): ubi_scan: process PEB 166
<7>UBI DBG (pid 732): ubi_scan: process PEB 167
<7>UBI DBG (pid 732): ubi_scan: process PEB 168
<7>UBI DBG (pid 732): ubi_scan: process PEB 169
<7>UBI DBG (pid 732): ubi_scan: process PEB 170
<7>UBI DBG (pid 732): ubi_scan: process PEB 171
<7>UBI DBG (pid 732): ubi_scan: process PEB 172
<7>UBI DBG (pid 732): ubi_scan: process PEB 173
<7>UBI DBG (pid 732): ubi_scan: process PEB 174
<7>UBI DBG (pid 732): ubi_scan: process PEB 175
<7>UBI DBG (pid 732): ubi_scan: process PEB 176
<7>UBI DBG (pid 732): ubi_scan: process PEB 177
<7>UBI DBG (pid 732): ubi_scan: process PEB 178
<7>UBI DBG (pid 732): ubi_scan: process PEB 179
<7>UBI DBG (pid 732): ubi_scan: process PEB 180
<7>UBI DBG (pid 732): ubi_scan: process PEB 181
<7>UBI DBG (pid 732): ubi_scan: process PEB 182
<7>UBI DBG (pid 732): ubi_scan: process PEB 183
<7>UBI DBG (pid 732): ubi_scan: process PEB 184
<7>UBI DBG (pid 732): ubi_scan: process PEB 185
<7>UBI DBG (pid 732): ubi_scan: process PEB 186
<7>UBI DBG (pid 732): ubi_scan: process PEB 187
<7>UBI DBG (pid 732): ubi_scan: process PEB 188
<7>UBI DBG (pid 732): ubi_scan: process PEB 189
<7>UBI DBG (pid 732): ubi_scan: process PEB 190
<7>UBI DBG (pid 732): ubi_scan: process PEB 191
<7>UBI DBG (pid 732): ubi_scan: process PEB 192
<7>UBI DBG (pid 732): ubi_scan: process PEB 193
<7>UBI DBG (pid 732): ubi_scan: process PEB 194
<7>UBI DBG (pid 732): ubi_scan: process PEB 195
<7>UBI DBG (pid 732): ubi_scan: process PEB 196
<7>UBI DBG (pid 732): ubi_scan: process PEB 197
<7>UBI DBG (pid 732): ubi_scan: process PEB 198
<7>UBI DBG (pid 732): ubi_scan: process PEB 199
<7>UBI DBG (pid 732): ubi_scan: process PEB 200
<7>UBI DBG (pid 732): ubi_scan: process PEB 201
<7>UBI DBG (pid 732): ubi_scan: process PEB 202
<7>UBI DBG (pid 732): ubi_scan: process PEB 203
<7>UBI DBG (pid 732): ubi_scan: process PEB 204
<7>UBI DBG (pid 732): ubi_scan: process PEB 205
<7>UBI DBG (pid 732): ubi_scan: process PEB 206
<7>UBI DBG (pid 732): ubi_scan: process PEB 207
<7>UBI DBG (pid 732): ubi_scan: process PEB 208
<7>UBI DBG (pid 732): ubi_scan: process PEB 209
<7>UBI DBG (pid 732): ubi_scan: process PEB 210
<7>UBI DBG (pid 732): ubi_scan: process PEB 211
<7>UBI DBG (pid 732): ubi_scan: process PEB 212
<7>UBI DBG (pid 732): ubi_scan: process PEB 213
<7>UBI DBG (pid 732): ubi_scan: process PEB 214
<7>UBI DBG (pid 732): ubi_scan: process PEB 215
<7>UBI DBG (pid 732): ubi_scan: process PEB 216
<7>UBI DBG (pid 732): ubi_scan: process PEB 217
<7>UBI DBG (pid 732): ubi_scan: process PEB 218
<7>UBI DBG (pid 732): ubi_scan: process PEB 219
<7>UBI DBG (pid 732): ubi_scan: process PEB 220
<7>UBI DBG (pid 732): ubi_scan: process PEB 221
<7>UBI DBG (pid 732): ubi_scan: process PEB 222
<7>UBI DBG (pid 732): ubi_scan: process PEB 223
<7>UBI DBG (pid 732): ubi_scan: process PEB 224
<7>UBI DBG (pid 732): ubi_scan: process PEB 225
<7>UBI DBG (pid 732): ubi_scan: process PEB 226
<7>UBI DBG (pid 732): ubi_scan: process PEB 227
<7>UBI DBG (pid 732): ubi_scan: process PEB 228
<7>UBI DBG (pid 732): ubi_scan: process PEB 229
<7>UBI DBG (pid 732): ubi_scan: process PEB 230
<7>UBI DBG (pid 732): ubi_scan: process PEB 231
<7>UBI DBG (pid 732): ubi_scan: process PEB 232
<7>UBI DBG (pid 732): ubi_scan: process PEB 233
<7>UBI DBG (pid 732): ubi_scan: process PEB 234
<7>UBI DBG (pid 732): ubi_scan: process PEB 235
<7>UBI DBG (pid 732): ubi_scan: process PEB 236
<7>UBI DBG (pid 732): ubi_scan: process PEB 237
<7>UBI DBG (pid 732): ubi_scan: process PEB 238
<7>UBI DBG (pid 732): ubi_scan: process PEB 239
<7>UBI DBG (pid 732): ubi_scan: process PEB 240
<7>UBI DBG (pid 732): ubi_scan: process PEB 241
<7>UBI DBG (pid 732): ubi_scan: process PEB 242
<7>UBI DBG (pid 732): ubi_scan: process PEB 243
<7>UBI DBG (pid 732): ubi_scan: process PEB 244
<7>UBI DBG (pid 732): ubi_scan: process PEB 245
<7>UBI DBG (pid 732): ubi_scan: process PEB 246
<7>UBI DBG (pid 732): ubi_scan: process PEB 247
<7>UBI DBG (pid 732): ubi_scan: process PEB 248
<7>UBI DBG (pid 732): ubi_scan: process PEB 249
<7>UBI DBG (pid 732): ubi_scan: process PEB 250
<7>UBI DBG (pid 732): ubi_scan: process PEB 251
<7>UBI DBG (pid 732): ubi_scan: process PEB 252
<7>UBI DBG (pid 732): ubi_scan: process PEB 253
<7>UBI DBG (pid 732): ubi_scan: process PEB 254
<7>UBI DBG (pid 732): ubi_scan: process PEB 255
<7>UBI DBG (pid 732): ubi_scan: process PEB 256
<7>UBI DBG (pid 732): ubi_scan: process PEB 257
<7>UBI DBG (pid 732): ubi_scan: process PEB 258
<7>UBI DBG (pid 732): ubi_scan: process PEB 259
<7>UBI DBG (pid 732): ubi_scan: process PEB 260
<7>UBI DBG (pid 732): ubi_scan: process PEB 261
<7>UBI DBG (pid 732): ubi_scan: process PEB 262
<7>UBI DBG (pid 732): ubi_scan: process PEB 263
<7>UBI DBG (pid 732): ubi_scan: process PEB 264
<7>UBI DBG (pid 732): ubi_scan: process PEB 265
<7>UBI DBG (pid 732): ubi_scan: process PEB 266
<7>UBI DBG (pid 732): ubi_scan: process PEB 267
<7>UBI DBG (pid 732): ubi_scan: process PEB 268
<7>UBI DBG (pid 732): ubi_scan: process PEB 269
<7>UBI DBG (pid 732): ubi_scan: process PEB 270
<7>UBI DBG (pid 732): ubi_scan: process PEB 271
<7>UBI DBG (pid 732): ubi_scan: process PEB 272
<7>UBI DBG (pid 732): ubi_scan: process PEB 273
<7>UBI DBG (pid 732): ubi_scan: process PEB 274
<7>UBI DBG (pid 732): ubi_scan: process PEB 275
<7>UBI DBG (pid 732): ubi_scan: process PEB 276
<7>UBI DBG (pid 732): ubi_scan: process PEB 277
<7>UBI DBG (pid 732): ubi_scan: process PEB 278
<7>UBI DBG (pid 732): ubi_scan: process PEB 279
<7>UBI DBG (pid 732): ubi_scan: process PEB 280
<7>UBI DBG (pid 732): ubi_scan: process PEB 281
<7>UBI DBG (pid 732): ubi_scan: process PEB 282
<7>UBI DBG (pid 732): ubi_scan: process PEB 283
<7>UBI DBG (pid 732): ubi_scan: process PEB 284
<7>UBI DBG (pid 732): ubi_scan: process PEB 285
<7>UBI DBG (pid 732): ubi_scan: process PEB 286
<7>UBI DBG (pid 732): ubi_scan: process PEB 287
<7>UBI DBG (pid 732): ubi_scan: process PEB 288
<7>UBI DBG (pid 732): ubi_scan: process PEB 289
<7>UBI DBG (pid 732): ubi_scan: process PEB 290
<7>UBI DBG (pid 732): ubi_scan: process PEB 291
<7>UBI DBG (pid 732): ubi_scan: process PEB 292
<7>UBI DBG (pid 732): ubi_scan: process PEB 293
<7>UBI DBG (pid 732): ubi_scan: process PEB 294
<7>UBI DBG (pid 732): ubi_scan: process PEB 295
<7>UBI DBG (pid 732): ubi_scan: process PEB 296
<7>UBI DBG (pid 732): ubi_scan: process PEB 297
<7>UBI DBG (pid 732): ubi_scan: process PEB 298
<7>UBI DBG (pid 732): ubi_scan: process PEB 299
<7>UBI DBG (pid 732): ubi_scan: process PEB 300
<7>UBI DBG (pid 732): ubi_scan: process PEB 301
<7>UBI DBG (pid 732): ubi_scan: process PEB 302
<7>UBI DBG (pid 732): ubi_scan: process PEB 303
<7>UBI DBG (pid 732): ubi_scan: process PEB 304
<7>UBI DBG (pid 732): ubi_scan: process PEB 305
<7>UBI DBG (pid 732): ubi_scan: process PEB 306
<7>UBI DBG (pid 732): ubi_scan: process PEB 307
<7>UBI DBG (pid 732): ubi_scan: process PEB 308
<7>UBI DBG (pid 732): ubi_scan: process PEB 309
<7>UBI DBG (pid 732): ubi_scan: process PEB 310
<7>UBI DBG (pid 732): ubi_scan: process PEB 311
<7>UBI DBG (pid 732): ubi_scan: process PEB 312
<7>UBI DBG (pid 732): ubi_scan: process PEB 313
<7>UBI DBG (pid 732): ubi_scan: process PEB 314
<7>UBI DBG (pid 732): ubi_scan: process PEB 315
<7>UBI DBG (pid 732): ubi_scan: process PEB 316
<7>UBI DBG (pid 732): ubi_scan: process PEB 317
<7>UBI DBG (pid 732): ubi_scan: process PEB 318
<7>UBI DBG (pid 732): ubi_scan: process PEB 319
<7>UBI DBG (pid 732): ubi_scan: process PEB 320
<7>UBI DBG (pid 732): ubi_scan: process PEB 321
<7>UBI DBG (pid 732): ubi_scan: process PEB 322
<7>UBI DBG (pid 732): ubi_scan: process PEB 323
<7>UBI DBG (pid 732): ubi_scan: process PEB 324
<7>UBI DBG (pid 732): ubi_scan: process PEB 325
<7>UBI DBG (pid 732): ubi_scan: process PEB 326
<7>UBI DBG (pid 732): ubi_scan: process PEB 327
<7>UBI DBG (pid 732): ubi_scan: process PEB 328
<7>UBI DBG (pid 732): ubi_scan: process PEB 329
<7>UBI DBG (pid 732): ubi_scan: process PEB 330
<7>UBI DBG (pid 732): ubi_scan: process PEB 331
<7>UBI DBG (pid 732): ubi_scan: process PEB 332
<7>UBI DBG (pid 732): ubi_scan: process PEB 333
<7>UBI DBG (pid 732): ubi_scan: process PEB 334
<7>UBI DBG (pid 732): ubi_scan: process PEB 335
<7>UBI DBG (pid 732): ubi_scan: process PEB 336
<7>UBI DBG (pid 732): ubi_scan: process PEB 337
<7>UBI DBG (pid 732): ubi_scan: process PEB 338
<7>UBI DBG (pid 732): ubi_scan: process PEB 339
<7>UBI DBG (pid 732): ubi_scan: process PEB 340
<7>UBI DBG (pid 732): ubi_scan: process PEB 341
<7>UBI DBG (pid 732): ubi_scan: process PEB 342
<7>UBI DBG (pid 732): ubi_scan: process PEB 343
<7>UBI DBG (pid 732): ubi_scan: process PEB 344
<7>UBI DBG (pid 732): ubi_scan: process PEB 345
<7>UBI DBG (pid 732): ubi_scan: process PEB 346
<7>UBI DBG (pid 732): ubi_scan: process PEB 347
<7>UBI DBG (pid 732): ubi_scan: process PEB 348
<7>UBI DBG (pid 732): ubi_scan: process PEB 349
<7>UBI DBG (pid 732): ubi_scan: process PEB 350
<7>UBI DBG (pid 732): ubi_scan: process PEB 351
<7>UBI DBG (pid 732): ubi_scan: process PEB 352
<7>UBI DBG (pid 732): ubi_scan: process PEB 353
<7>UBI DBG (pid 732): ubi_scan: process PEB 354
<7>UBI DBG (pid 732): ubi_scan: process PEB 355
<7>UBI DBG (pid 732): ubi_scan: process PEB 356
<7>UBI DBG (pid 732): ubi_scan: process PEB 357
<7>UBI DBG (pid 732): ubi_scan: process PEB 358
<7>UBI DBG (pid 732): ubi_scan: process PEB 359
<7>UBI DBG (pid 732): ubi_scan: process PEB 360
<7>UBI DBG (pid 732): ubi_scan: process PEB 361
<7>UBI DBG (pid 732): ubi_scan: process PEB 362
<7>UBI DBG (pid 732): ubi_scan: process PEB 363
<7>UBI DBG (pid 732): ubi_scan: process PEB 364
<7>UBI DBG (pid 732): ubi_scan: process PEB 365
<7>UBI DBG (pid 732): ubi_scan: process PEB 366
<7>UBI DBG (pid 732): ubi_scan: process PEB 367
<7>UBI DBG (pid 732): ubi_scan: process PEB 368
<7>UBI DBG (pid 732): ubi_scan: process PEB 369
<7>UBI DBG (pid 732): ubi_scan: process PEB 370
<7>UBI DBG (pid 732): ubi_scan: process PEB 371
<7>UBI DBG (pid 732): ubi_scan: process PEB 372
<7>UBI DBG (pid 732): ubi_scan: process PEB 373
<7>UBI DBG (pid 732): ubi_scan: process PEB 374
<7>UBI DBG (pid 732): ubi_scan: process PEB 375
<7>UBI DBG (pid 732): ubi_scan: process PEB 376
<7>UBI DBG (pid 732): ubi_scan: process PEB 377
<7>UBI DBG (pid 732): ubi_scan: process PEB 378
<7>UBI DBG (pid 732): ubi_scan: process PEB 379
<7>UBI DBG (pid 732): ubi_scan: process PEB 380

<7>UBI DBG (pid 732): ubi_scan: process PEB 381
<7>UBI DBG (pid 732): ubi_scan: process PEB 382
<7>UBI DBG (pid 732): ubi_scan: process PEB 383
<7>UBI DBG (pid 732): ubi_scan: process PEB 384
<7>UBI DBG (pid 732): ubi_scan: process PEB 385
<7>UBI DBG (pid 732): ubi_scan: process PEB 386
<7>UBI DBG (pid 732): ubi_scan: process PEB 387
<7>UBI DBG (pid 732): ubi_scan: process PEB 388
<7>UBI DBG (pid 732): ubi_scan: process PEB 389
<7>UBI DBG (pid 732): ubi_scan: process PEB 390
<7>UBI DBG (pid 732): ubi_scan: process PEB 391
<7>UBI DBG (pid 732): ubi_scan: process PEB 392
<7>UBI DBG (pid 732): ubi_scan: process PEB 393
<7>UBI DBG (pid 732): ubi_scan: process PEB 394
<7>UBI DBG (pid 732): ubi_scan: process PEB 395
<7>UBI DBG (pid 732): ubi_scan: process PEB 396
<7>UBI DBG (pid 732): ubi_scan: process PEB 397
<7>UBI DBG (pid 732): ubi_scan: process PEB 398
<7>UBI DBG (pid 732): ubi_scan: process PEB 399
<7>UBI DBG (pid 732): ubi_scan: process PEB 400
<7>UBI DBG (pid 732): ubi_scan: process PEB 401
<7>UBI DBG (pid 732): ubi_scan: process PEB 402
<7>UBI DBG (pid 732): ubi_scan: process PEB 403
<7>UBI DBG (pid 732): ubi_scan: process PEB 404
<7>UBI DBG (pid 732): ubi_scan: process PEB 405
<7>UBI DBG (pid 732): ubi_scan: process PEB 406
<7>UBI DBG (pid 732): ubi_scan: process PEB 407
<7>UBI DBG (pid 732): ubi_scan: process PEB 408
<7>UBI DBG (pid 732): ubi_scan: process PEB 409
<7>UBI DBG (pid 732): ubi_scan: process PEB 410
<7>UBI DBG (pid 732): ubi_scan: process PEB 411
<7>UBI DBG (pid 732): ubi_scan: process PEB 412
<7>UBI DBG (pid 732): ubi_scan: process PEB 413
<7>UBI DBG (pid 732): ubi_scan: process PEB 414
<7>UBI DBG (pid 732): ubi_scan: process PEB 415
<7>UBI DBG (pid 732): ubi_scan: process PEB 416
<7>UBI DBG (pid 732): ubi_scan: process PEB 417
<7>UBI DBG (pid 732): ubi_scan: process PEB 418
<7>UBI DBG (pid 732): ubi_scan: process PEB 419
<7>UBI DBG (pid 732): ubi_scan: process PEB 420
<7>UBI DBG (pid 732): ubi_scan: process PEB 421
<7>UBI DBG (pid 732): ubi_scan: process PEB 422
<7>UBI DBG (pid 732): ubi_scan: process PEB 423
<7>UBI DBG (pid 732): ubi_scan: process PEB 424
<7>UBI DBG (pid 732): ubi_scan: process PEB 425
<7>UBI DBG (pid 732): ubi_scan: process PEB 426
<7>UBI DBG (pid 732): ubi_scan: process PEB 427
<7>UBI DBG (pid 732): ubi_scan: process PEB 428
<7>UBI DBG (pid 732): ubi_scan: process PEB 429
<7>UBI DBG (pid 732): ubi_scan: process PEB 430
<7>UBI DBG (pid 732): ubi_scan: process PEB 431
<7>UBI DBG (pid 732): ubi_scan: process PEB 432
<7>UBI DBG (pid 732): ubi_scan: process PEB 433
<7>UBI DBG (pid 732): ubi_scan: process PEB 434
<7>UBI DBG (pid 732): ubi_scan: process PEB 435
<7>UBI DBG (pid 732): ubi_scan: process PEB 436
<7>UBI DBG (pid 732): ubi_scan: process PEB 437
<7>UBI DBG (pid 732): ubi_scan: process PEB 438
<7>UBI DBG (pid 732): ubi_scan: process PEB 439
<7>UBI DBG (pid 732): ubi_scan: process PEB 440
<7>UBI DBG (pid 732): ubi_scan: process PEB 441
<7>UBI DBG (pid 732): ubi_scan: process PEB 442
<7>UBI DBG (pid 732): ubi_scan: process PEB 443
<7>UBI DBG (pid 732): ubi_scan: process PEB 444
<7>UBI DBG (pid 732): ubi_scan: process PEB 445
<7>UBI DBG (pid 732): ubi_scan: process PEB 446
<7>UBI DBG (pid 732): ubi_scan: process PEB 447
<7>UBI DBG (pid 732): ubi_scan: process PEB 448
<7>UBI DBG (pid 732): ubi_scan: process PEB 449
<7>UBI DBG (pid 732): ubi_scan: process PEB 450
<7>UBI DBG (pid 732): ubi_scan: process PEB 451
<7>UBI DBG (pid 732): ubi_scan: process PEB 452
<7>UBI DBG (pid 732): ubi_scan: process PEB 453
<7>UBI DBG (pid 732): ubi_scan: process PEB 454
<7>UBI DBG (pid 732): ubi_scan: process PEB 455
<7>UBI DBG (pid 732): ubi_scan: process PEB 456
<7>UBI DBG (pid 732): ubi_scan: process PEB 457
<7>UBI DBG (pid 732): ubi_scan: process PEB 458
<7>UBI DBG (pid 732): ubi_scan: process PEB 459
<7>UBI DBG (pid 732): ubi_scan: process PEB 460
<7>UBI DBG (pid 732): ubi_scan: process PEB 461
<6>Block 2936 is factory bad in chip 0, offset =3D 16f00000
<7>UBI DBG (pid 732): ubi_scan: process PEB 462
<7>UBI DBG (pid 732): ubi_scan: process PEB 463
<7>UBI DBG (pid 732): ubi_scan: process PEB 464
<7>UBI DBG (pid 732): ubi_scan: process PEB 465
<7>UBI DBG (pid 732): ubi_scan: process PEB 466
<7>UBI DBG (pid 732): ubi_scan: process PEB 467
<7>UBI DBG (pid 732): ubi_scan: process PEB 468
<7>UBI DBG (pid 732): ubi_scan: process PEB 469
<7>UBI DBG (pid 732): ubi_scan: process PEB 470
<7>UBI DBG (pid 732): ubi_scan: process PEB 471
<7>UBI DBG (pid 732): ubi_scan: process PEB 472
<7>UBI DBG (pid 732): ubi_scan: process PEB 473
<7>UBI DBG (pid 732): ubi_scan: process PEB 474
<7>UBI DBG (pid 732): ubi_scan: process PEB 475
<7>UBI DBG (pid 732): ubi_scan: process PEB 476
<7>UBI DBG (pid 732): ubi_scan: process PEB 477
<7>UBI DBG (pid 732): ubi_scan: process PEB 478
<7>UBI DBG (pid 732): ubi_scan: process PEB 479
<7>UBI DBG (pid 732): ubi_scan: process PEB 480
<7>UBI DBG (pid 732): ubi_scan: process PEB 481
<7>UBI DBG (pid 732): ubi_scan: process PEB 482
<7>UBI DBG (pid 732): ubi_scan: process PEB 483
<7>UBI DBG (pid 732): ubi_scan: process PEB 484
<7>UBI DBG (pid 732): ubi_scan: process PEB 485
<7>UBI DBG (pid 732): ubi_scan: process PEB 486
<7>UBI DBG (pid 732): ubi_scan: process PEB 487
<7>UBI DBG (pid 732): ubi_scan: process PEB 488
<7>UBI DBG (pid 732): ubi_scan: process PEB 489
<7>UBI DBG (pid 732): ubi_scan: process PEB 490
<7>UBI DBG (pid 732): ubi_scan: process PEB 491
<7>UBI DBG (pid 732): ubi_scan: process PEB 492
<7>UBI DBG (pid 732): ubi_scan: process PEB 493
<7>UBI DBG (pid 732): ubi_scan: process PEB 494
<7>UBI DBG (pid 732): ubi_scan: process PEB 495
<7>UBI DBG (pid 732): ubi_scan: process PEB 496
<7>UBI DBG (pid 732): ubi_scan: process PEB 497
<7>UBI DBG (pid 732): ubi_scan: process PEB 498
<7>UBI DBG (pid 732): ubi_scan: process PEB 499
<7>UBI DBG (pid 732): ubi_scan: process PEB 500
<7>UBI DBG (pid 732): ubi_scan: process PEB 501
<7>UBI DBG (pid 732): ubi_scan: process PEB 502
<7>UBI DBG (pid 732): ubi_scan: process PEB 503
<7>UBI DBG (pid 732): ubi_scan: process PEB 504
<7>UBI DBG (pid 732): ubi_scan: process PEB 505
<7>UBI DBG (pid 732): ubi_scan: process PEB 506
<7>UBI DBG (pid 732): ubi_scan: process PEB 507
<7>UBI DBG (pid 732): ubi_scan: process PEB 508
<7>UBI DBG (pid 732): ubi_scan: process PEB 509
<7>UBI DBG (pid 732): ubi_scan: process PEB 510
<7>UBI DBG (pid 732): ubi_scan: process PEB 511
<7>UBI DBG (pid 732): ubi_scan: scanning is finished
<6>Block 2540 is factory bad in chip 0, offset =3D 13d80000
<6>Block 2541 is factory bad in chip 0, offset =3D 13da0000
<6>Block 2936 is factory bad in chip 0, offset =3D 16f00000
<7>UBI DBG (pid 732): process_lvol: check layout volume
<7>UBI DBG (pid 732): ubi_resize_volume: re-size device 0, volume 2 to
from 133 to 234 PEBs
<5>UBI: volume 2 ("userdata") re-sized from 133 to 234 LEBs
<7>UBI DBG (pid 732): uif_init: ubi0 major is 249
<7>UBI DBG (pid 732): ubi_add_volume: add volume 0
<7>UBI DBG (pid 732): ubi_add_volume: add volume 1
<7>UBI DBG (pid 732): ubi_add_volume: add volume 2
<5>UBI: attached mtd5 to ubi0
<5>UBI: MTD device name:            "ubi"
<5>UBI: MTD device size:            64 MiB
<5>UBI: number of good PEBs:        509
<5>UBI: number of bad PEBs:         3
<5>UBI: max. allowed volumes:       128
<5>UBI: wear-leveling threshold:    4096
<5>UBI: number of internal volumes: 1
<5>UBI: number of user volumes:     3
<5>UBI: available PEBs:             0
<5>UBI: total number of reserved PEBs: 509
<5>UBI: number of PEBs reserved for bad PEB handling: 5
<5>UBI: max/mean erase counter: 1/0
<5>UBI: image sequence number: 506431851
<5>UBI: background thread "ubi_bgt0d" started, PID 737
<7>UBIFS DBG (pid 763): ubifs_get_sb: name ubi0_0, flags 0x8000
<7>UBI DBG (pid 763): ubi_open_volume_path: open volume ubi0_0, mode 1
<7>UBI DBG (pid 763): ubi_open_volume: open device 0, volume 0, mode 1
<7>UBIFS DBG (pid 763): ubifs_get_sb: opened ubi0_0
<7>UBI DBG (pid 763): ubi_open_volume: open device 0, volume 0, mode 2
<7>UBI DBG (pid 763): ubi_is_mapped: test LEB 0:0
<7>UBIFS DBG (pid 763): ubifs_read_node: LEB 0:0, superblock node, length 4=
096
<7>UBI DBG (pid 763): ubi_leb_read: read 4096 bytes from LEB 0:0:0
<7>UBIFS DBG (pid 763): ubifs_read_superblock: Auto resizing (sb) from
64 LEBs to 128 LEBs
<7>UBI DBG (pid 763): ubi_leb_change: atomically write 4096 bytes to LEB 0:=
0
<7>UBIFS DBG (pid 763): ubifs_start_scan: scan LEB 1:0
<7>UBI DBG (pid 763): ubi_leb_read: read 126976 bytes from LEB 0:1:0
<7>UBIFS DBG (pid 765): ubifs_bg_thread: background thread
"ubifs_bgt0_0" started, PID 765
<7>UBIFS DBG (pid 763): ubifs_scan: look at LEB 1:0 (126976 bytes left)
<7>UBIFS DBG (pid 763): ubifs_scan_a_node: scanning master node
<7>UBIFS DBG (pid 763): ubifs_scan: look at LEB 1:512 (126464 bytes left)
<7>UBIFS DBG (pid 763): ubifs_scan_a_node: scanning padding node
<7>UBIFS DBG (pid 763): ubifs_scan_a_node: 1508 bytes padded, offset now 20=
48
<7>UBIFS DBG (pid 763): ubifs_scan: look at LEB 1:2048 (124928 bytes left)
<7>UBIFS DBG (pid 763): ubifs_scan_a_node: hit empty space
<7>UBIFS DBG (pid 763): ubifs_end_scan: stop scanning LEB 1 at offset 2048
<7>UBIFS DBG (pid 763): ubifs_start_scan: scan LEB 2:0
<7>UBI DBG (pid 763): ubi_leb_read: read 126976 bytes from LEB 0:2:0
<7>UBIFS DBG (pid 763): ubifs_scan: look at LEB 2:0 (126976 bytes left)
<7>UBIFS DBG (pid 763): ubifs_scan_a_node: scanning master node
<7>UBIFS DBG (pid 763): ubifs_scan: look at LEB 2:512 (126464 bytes left)
<7>UBIFS DBG (pid 763): ubifs_scan_a_node: scanning padding node
<7>UBIFS DBG (pid 763): ubifs_scan_a_node: 1508 bytes padded, offset now 20=
48
<7>UBIFS DBG (pid 763): ubifs_scan: look at LEB 2:2048 (124928 bytes left)
<7>UBIFS DBG (pid 763): ubifs_scan_a_node: hit empty space
<7>UBIFS DBG (pid 763): ubifs_end_scan: stop scanning LEB 2 at offset 2048
<7>UBIFS DBG (pid 763): ubifs_read_master: Auto resizing (master) from
64 LEBs to 128 LEBs
<7>UBIFS DBG (pid 763): ubifs_read_node: LEB 63:74888, indexing node, lengt=
h 148
<7>UBI DBG (pid 763): ubi_leb_read: read 148 bytes from LEB 0:63:74888
<7>UBIFS DBG (pid 763): ubifs_write_node: LEB 1:2048, master node,
length 512 (aligned 2048)
<7>UBI DBG (pid 763): ubi_leb_write: write 2048 bytes to LEB 0:1:2048
<3>UBI error: ubi_io_read: error -22 while reading 2048 bytes from PEB
3:6144, read 0 bytes

 Backtrace:
 [<c002daac>]
(dump_backtrace+0x0/0x10c)
from [<c039eb48>]
(dump_stack+0x18/0x1c)
 r7:00000800
 r6:db100800
 r5:ffffffea
 r4:00000800

 [<c039eb30>]
(dump_stack+0x0/0x1c)
from [<c02b0684>]
(ubi_io_read+0x160/0x284)
 [<c02b0524>]
(ubi_io_read+0x0/0x284)
from [<c02b07f4>]
(ubi_dbg_check_write+0x4c/0x19c)
 [<c02b07a8>]
(ubi_dbg_check_write+0x0/0x19c)
from [<c02b0f98>]
(ubi_io_write+0x12c/0x3dc)
 [<c02b0e6c>]
(ubi_io_write+0x0/0x3dc)
from [<c02ae9dc>]
(ubi_eba_write_leb+0x90/0x840)
 [<c02ae94c>]
(ubi_eba_write_leb+0x0/0x840)
from [<c02ace28>]
(ubi_leb_write+0x134/0x140)
 [<c02accf4>]
(ubi_leb_write+0x0/0x140)
from [<c01b1d3c>]
(dbg_leb_write+0x128/0x140)
 [<c01b1c14>]
(dbg_leb_write+0x0/0x140)
from [<c018ad94>]
(ubifs_write_node+0xd4/0x210)
 [<c018acc0>]
(ubifs_write_node+0x0/0x210)
from [<c0190c64>]
(ubifs_write_master+0xac/0x15c)
 [<c0190bb8>]
(ubifs_write_master+0x0/0x15c)
from [<c0185e04>]
(ubifs_fill_super+0xbfc/0x1a80)
 r7:00000070
 r6:db085008
 r5:db085000
 r4:00000000


 [<c0185208>]
(ubifs_fill_super+0x0/0x1a80)
from [<c0186d74>]
(ubifs_get_sb+0xec/0x36c)
 [<c0186c88>]
(ubifs_get_sb+0x0/0x36c)
from [<c00ff488>]
(vfs_kern_mount+0x58/0xac)
 [<c00ff430>]
(vfs_kern_mount+0x0/0xac)
from [<c00ff538>]
(do_kern_mount+0x3c/0xdc)
 r8:00008000
 r7:db08f000
 r6:00000000
 r5:dbad1000
 r4:c04d5d58

 [<c00ff4fc>]
(do_kern_mount+0x0/0xdc)
from [<c0116df0>]
(do_mount+0x16c/0x76c)
 r9:00000000
 r8:00008000
 r7:dbad1000
 r6:db08f000
 r5:00000000
 r4:00000000



 [<c0116c84>]
(do_mount+0x0/0x76c)
from [<c0117480>]
(sys_mount+0x90/0xdc)
 [<c01173f0>]
(sys_mount+0x0/0xdc)
from [<c0029b80>]
(ret_fast_syscall+0x0/0x2c)
 r7:00000015
 r6:afe47470
 r5:00000104
 r4:00000000

 <4>UBI warning: ubi_eba_write_leb: failed to write data to PEB 3
 <4>UBI warning: ubi_ro_mode: switch to read-only mode
 <3>UBIFS error (pid 763): ubifs_write_node: cannot write 2048 bytes
to LEB 1:2048, error -22

<7>	magic          0x6101831
<7>	crc            0xfd668bb6
<7>	node_type      7 (master node)
<7>	group_type     0 (no node group)
<7>	sqnum          3342
<7>	len            512
<7>	highest_inum   276
<7>	commit number  0
<7>	flags          0x3
<7>	log_lnum       3
<7>	root_lnum      63
<7>	root_offs      74888
<7>	root_len       148
<7>	gc_lnum        62
<7>	ihead_lnum     63
<7>	ihead_offs     75776
<7>	index_size     75040
<7>	lpt_lnum       7
<7>	lpt_offs       298
<7>	nhead_lnum     7
<7>	nhead_offs     2048
<7>	ltab_lnum      7
<7>	ltab_offs      310
<7>	lsave_lnum     0
<7>	lsave_offs     0
<7>	lscan_lnum     10
<7>	leb_cnt        128
<7>	empty_lebs     65
<7>	idx_lebs       1
<7>	total_free     8345600
<7>	total_dirty    42592
<7>	total_used     6519936
<7>	total_dead     30120
<7>	total_dark     451432

 Backtrace:
 [<c002daac>]
(dump_backtrace+0x0/0x10c)
from [<c039eb48>]
(dump_stack+0x18/0x1c)
 r7:ffffffea
 r6:00000001
 r5:00000800
 r4:db085000

 [<c039eb30>]
(dump_stack+0x0/0x1c)
from [<c018ade8>]
(ubifs_write_node+0x128/0x210)
 [<c018acc0>]
(ubifs_write_node+0x0/0x210)
from [<c0190c64>]
(ubifs_write_master+0xac/0x15c)
 [<c0190bb8>]
(ubifs_write_master+0x0/0x15c)
from [<c0185e04>]
(ubifs_fill_super+0xbfc/0x1a80)
 r7:00000070
 r6:db085008
 r5:db085000
 r4:00000000

 [<c0185208>]
(ubifs_fill_super+0x0/0x1a80)
from [<c0186d74>]
(ubifs_get_sb+0xec/0x36c)
 [<c0186c88>]
(ubifs_get_sb+0x0/0x36c)
from [<c00ff488>]
(vfs_kern_mount+0x58/0xac)
 [<c00ff430>]
(vfs_kern_mount+0x0/0xac)
from [<c00ff538>]
(do_kern_mount+0x3c/0xdc)
 r8:00008000
 r7:db08f000
 r6:00000000
 r5:dbad1000
 r4:c04d5d58

 [<c00ff4fc>]
(do_kern_mount+0x0/0xdc)
from [<c0116df0>]
(do_mount+0x16c/0x76c)
 r9:00000000
 r8:00008000
 r7:dbad1000
 r6:db08f000
 r5:00000000
 r4:00000000

 [<c0116c84>]
(do_mount+0x0/0x76c)
from [<c0117480>]
(sys_mount+0x90/0xdc)
 [<c01173f0>]
(sys_mount+0x0/0xdc)
from [<c0029b80>]
(ret_fast_syscall+0x0/0x2c)
 r7:00000015
 r6:afe47470
 r5:00000104
 r4:00000000

<7>UBIFS DBG (pid 765): ubifs_bg_thread: background thread "ubifs_bgt0_0" s=
tops
<7>UBI DBG (pid 763): ubi_close_volume: close device 0, volume 0, mode 2
<7>UBI DBG (pid 763): ubi_close_volume: close device 0, volume 0, mode 1


=D4=DA 2010=C4=EA5=D4=C24=C8=D5=C9=CF=CE=E711:20=A3=AC=C1=D6=D3=DA=BE=FE <o=
kpalin@gmail.com> =8C=91=B5=C0=A3=BA
> Dear all,
>
> I find the root cause: bootloader
>
> UBI image, written by bootloader, could not be mount.
> UBI image, written by ubiformat command, could be mount correctly.
>
> I guess that bootloader may not write ubi image correctly.
> I will port ubiformat in bootloader.
>
> Thank you,
> Best regards,
>
> 2010/5/3 Artem Bityutskiy <dedekind1@gmail.com>:
>> On Mon, 2010-05-03 at 19:54 +0800, =C1=D6=D3=DA=BE=FE wrote:
>>> Dear all,
>>>
>>> Thank you for your support.
>>> I can mount UBIFS now after fixing mtd read function.
>>>
>>> However, if I enable the "extra checks" of UBI and UBIFS, then I can
>>> not mount UBIFS.
>>> What's the different after enable "extra checks" of UBI and UBIFS.
>>
>> Well, these are various self-checks. There are many of them and they are
>> different. E.g., in UBI some of them read flash before every writing and
>> make sure the area contains all 0xFF bytes. In UBIFS this can be walking
>> through the whole index tree and checks it. There are many of them and
>> they are different.
>>
>> If things stop working for you when you enable all checks, this either
>> means a bug in the debugging code or a real problem. Please, post your
>> error report. Use this guide:
>>
>> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
>>
>> --
>> Best Regards,
>> Artem Bityutskiy (=A7=A1=A7=E2=A7=E4=A7=D7=A7=DE =A7=A2=A7=DA=A7=E4=A7=
=F0=A7=E8=A7=DC=A7=DA=A7=DB)
>>
>>
>
